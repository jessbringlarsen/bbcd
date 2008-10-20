-- id for seneste ratingopdatering
DROP VIEW IF EXISTS `rating_update_h`;
CREATE VIEW `rating_update_h` AS
	select id
	from rating_update
	order by date_of_update desc
	limit 1;

DROP VIEW IF EXISTS `player_v`;
CREATE VIEW `player_v` AS
	select p.*
	from player p
	join rating r on p.id = r.player_id
	where r.rating_update_id = (select * from rating_update_h);

delimiter|

drop procedure if exists updatePlayerRatingStat|
create procedure updatePlayerRatingStat()
LANGUAGE SQL
MODIFIES SQL DATA
COMMENT 'Update statement for opdatering af spillerrating 2*seneste rating - (seneste rating + forrige rating) = frem- eller tilbage-gang i rating'
BEGIN
	declare ratingupdateid int(11);

	-- Vælg den seneste ratingopdatering
	select id
	into ratingupdateid
	from rating_update_h;

	-- Insert statistik rækker for spillere. Ignorer hvis der allerede findes en række.
	insert ignore into player_stat
		(version, player_id, rating_status, rating_update_id, credit_status)
		(select 0, id, 0, ratingupdateid, 0 from player);

	-- Opdater statistik rækker for alle spillere. Dvs. frem- eller tilbage-gang i rating sidstn sidste opdatering.
	update player_stat ss set rating_status =
		((select 2*r.rating
		from rating r
		where r.player_id = ss.player_id
			and r.rating_update_id = ratingupdateid)
		-
		(select sum(r.rating)
		from rating r
		join (
		select ro.id
		from rating_update ro
		order by ro.date_of_update desc limit 2) ro on ro.id = r.rating_update_id
		where r.player_id = ss.player_id))
	where ss.rating_update_id = ratingupdateid;

	-- Indsæt række i tabel der angiver hvor meget prisen på spilleren
	-- er gået ned eller op siden sidste ratingopdatering.
	UPDATE player_stat ss SET ss.credit_status =
	 (SELECT sp.credit from points_rule sp
	 WHERE sp.from_rating <= ss.rating_status AND sp.to_rating >= ss.rating_status)
	 WHERE ss.rating_update_id = ratingupdateid;

END|

drop procedure if exists updateTeamRatingStat|
create procedure updateTeamRatingStat()
LANGUAGE SQL
MODIFIES SQL DATA
COMMENT 'For alle spillere på et sammensat hold, summér deres ratingtals frem- eller tilbage-gang'
BEGIN
	declare ratingupdate_id int(11);

	-- Vælg den seneste ratingopdatering
	select id
	into ratingupdate_id
	from rating_update_h;

	-- Drop alle eventuelle eksisterende statistik rækker for det aktuelle ratingopdatering
	delete from team_stat where rating_update_id = ratingupdate_id;

	-- Indsæt rating statistik for hold
	insert ignore into team_stat (version, team_id, rating_update_id, rating_status)
		(select 0, tp.team_id, ratingupdate_id, sum(rating_status) from team_player tp
		join player_stat ps on ps.player_id = tp.player_id
		group by tp.team_id);

	-- Indsæt point statistik for hold		
	update team_stat ts set ts.credit_status = 
		(SELECT sum(ps.credit_status)
			FROM team_player tp
				JOIN player_stat ps ON ps.player_id = tp.player_id
			WHERE tp.team_id = ts.team_id
				AND ps.rating_update_id=ratingupdate_id);

	-- Opdater placering for holdene
	update team_stat sh set sh.position =
   		(select @rownum:=@rownum+1 position from (select @rownum:=0) r)
		where sh.rating_update_id = ratingupdate_id order by sh.rating_status desc;
END|

drop procedure if exists updateLeagueRatingStat|
create procedure updateLeagueRatingStat()
LANGUAGE SQL
MODIFIES SQL DATA
COMMENT 'For alle hold i en liga, summér deres ratingtals frem- eller tilbage-gang, samt ligaens samlede placering'
BEGIN
	declare ratingupdate_id int(11);

	-- Vælg den seneste ratingopdatering
	select id
	into ratingupdate_id
	from rating_update_h;

	-- Drop alle eventuelle eksisterende statistik rækker for det aktuelle ratingopdatering
	delete from league_stat where rating_update_id = ratingupdate_id;

	-- Indsæt statistik for liga
	insert into league_stat (version, league_id, rating_update_id, rating_status, credit_status, position)
		(select 0, lp.league_id, ratingupdate_id, sum(rating_status), sum(credit_status), 0 from league_participant lp
		join team_stat ts on ts.team_id = lp.team_id
		group by lp.league_id);

	-- 	Opdater placering for liga
	update league_stat ls set ls.position =
   		(select @rownum:=@rownum+1 placering from (select @rownum:=0) r)
		where ls.rating_update_id = ratingupdate_id order by ls.rating_status desc;
END|