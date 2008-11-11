-- gets the latest rating update
DROP VIEW IF EXISTS `rating_update_h`;
CREATE VIEW `rating_update_h` AS
	select id
	from rating_update
	order by date_of_update desc
	limit 1;

-- View displaying the age of a player
DROP VIEW IF EXISTS `player_age`;
CREATE VIEW `player_age` AS
	select
		p.id,
		format((SELECT DATE_FORMAT(NOW(), '%Y') - DATE_FORMAT(p.date_of_birth, '%Y') - (DATE_FORMAT(NOW(), '00-%m-%d') < DATE_FORMAT(p.date_of_birth, '00-%m-%d'))), 0) AS age
	from
		player p;

-- A domain class is based on this view.
-- Grails automaticly creates a table that we drop here.
DROP TABLE IF EXISTS `player_view`;
DROP VIEW IF EXISTS `player_view`;
create view player_view as
select
    s.id,
    s.version,
    DATE_FORMAT(s.date_of_birth, '%d-%m-%Y') as date_of_birth,
    s.gender,
    s.name,
    pa.age,
    r.rating,
    lcp.price,
    k.name as club_name,
    k.short_name as club_name_short,
    pst.no_of_times_bought,
    pst.no_of_times_sold
from
    player s
    join player_age pa on pa.id = s.id
    join rating r on s.id = r.player_id
        and r.rating_update_id = (select id from rating_update_h)
    join club k on r.club_id = k.id
    join license_class lk on lk.gender = s.gender
        and lk.min_rating <= r.rating
        and lk.max_rating >= r.rating
    join license_class_price lcp on lcp.id = lk.price_id
    join license_class_age lca on lca.id = lk.age_id
        and lca.age_from <= pa.age
        and lca.age_to >= pa.age
    left outer join player_stat_tournament pst on pst.player_id = s.id
        and pst.tournament_id = (select id from tournament where is_current_tournament = 1);

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