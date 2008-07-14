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
		(player, rating_status, rating_update)
		(select id, 0, ratingupdateid from player);

	-- Opdater statistik rækker for alle spillere. Dvs. frem- eller tilbage-gang i rating sidstn sidste opdatering.
	update player_stat ss set rating_status =
		((select 2*r.rating
		from rating r
		where r.player_id = ss.player
			and r.rating_update_id = ratingupdateid)
		-
		(select sum(r.rating)
		from rating r
		join (
		select ro.id
		from rating_update ro
		order by ro.date_of_update desc limit 2) ro on ro.id = r.rating_update_id
		where r.player_id = ss.player))
	where ss.rating_update = ratingupdateid;

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
	delete from stat_team where rating_update_id = ratingupdate_id;

	-- Indsæt rating statistik for hold
	insert into stat_team (teamid, rating_update, rating_status)
		(select tp.team_id, ratingupdate_id, sum(rating_status) from team_player tp
		join player_stat ps on ps.player = tp.player_id
		group by tp.team_id);

	-- Indsæt point statistik for hold		
	update team_stat ts set sh.credit_status = 
		(SELECT sum(ps.credit_status)
			FROM team_player tp
				JOIN player_stat ps ON ps.player = tp.player_id
			WHERE tp.team_id = ts.team_id
				AND ps.raitng_update=ratingupdate_id);

	-- Opdater placering for holdene
	update team_stat sh set sh.position =
   		(select @rownum:=@rownum+1 position from (select @rownum:=0) r)
		where sh.rating_update = ratingupdate_id order by sh.rating_status desc;
END|