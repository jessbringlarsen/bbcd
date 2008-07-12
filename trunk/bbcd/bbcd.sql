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
