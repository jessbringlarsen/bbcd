-- Udfør ikke dette script med phpAdmin brug MySQL Query Browser fra mysql.com
-- Der er en bug der gør at der ikke kan skiftes delimiter hvilket er et problem ved
-- oprettelse af stored procedures.   

-- phpMyAdmin SQL Dump
-- Database: `bbcd`
-- Sæt import tegnsæt til: utf8

-- --------------------------------------------------------

SET FOREIGN_KEY_CHECKS=0;

SET CHARACTER SET `UTF8`;

DROP DATABASE IF EXISTS `bbcd`;

CREATE DATABASE `bbcd`;

USE `bbcd`;

-- --------------------------------------------------------
--
-- Struktur-dump for tabellen `turnering`
-- Tabellen indeholder mulige turneringer, f.eks. turnering for sæson 2005-2006

DROP TABLE IF EXISTS `turnering`;
CREATE TABLE IF NOT EXISTS `turnering` (
  `turneringid` int(11) NOT NULL auto_increment,
  `turneringnavn` varchar(50) NOT NULL default '',
  `turneringstart` date NOT NULL default '1979-01-01',
  `turneringslut` date NOT NULL default '1979-01-01',
  `aktuelturnering` tinyint(1) default 0 COMMENT 'Angiver om turneringen er den gældene for spillet (0 false, 1 true).',
  PRIMARY KEY  (`turneringid`),
  UNIQUE KEY `navn` (`turneringnavn`),
  UNIQUE KEY `periode` (`turneringstart`,`turneringslut`),
  KEY `aktuelturnering` (`aktuelturnering`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------
--
-- Struktur-dump for tabellen `holdpoint`
-- Tabellen indeholder ponint et hold har
-- for en bestemt ratingopdatering.

DROP TABLE IF EXISTS `holdpoint`;
CREATE TABLE IF NOT EXISTS `holdpoint` (
  `holdpointid` int(11) NOT NULL auto_increment,
  `points` int(11) NOT NULL default 0 COMMENT 'Akkumuleret point for et hold ved hver ratingopdatering',
  `ratingopdateringid` int(11) NOT NULL default 0,
  `holdid` int(11) NOT NULL default 0,
  PRIMARY KEY  (`holdpointid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------
--
-- Struktur-dump for tabellen `spillerpoint`
-- Tabellen indeholder akkumulerede point en spiller har
-- for en bestemt ratingopdatering.

DROP TABLE IF EXISTS `spillerpoint`;
CREATE TABLE IF NOT EXISTS `spillerpoint` (
  `spillerpointid` int(11) NOT NULL auto_increment,
  `points` int(11) NOT NULL default 0 COMMENT 'Akkumuleret point for spillere som udgøres af forskellene fra hver ratingopdatering.',
  `ratingopdateringid` int(11) NOT NULL default 0,
  `spillerid` int(11) NOT NULL default 0,
  PRIMARY KEY  (`spillerpointid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `btunion`
--
DROP TABLE IF EXISTS `btunion`;
CREATE TABLE IF NOT EXISTS `btunion` (
  `unionid` int(11) NOT NULL auto_increment,
  `navn` varchar(10) NOT NULL default '',
  PRIMARY KEY  (`unionid`),
  UNIQUE KEY `navn` (`navn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `hold`
--

DROP TABLE IF EXISTS `hold`;
CREATE TABLE IF NOT EXISTS `hold` (
  `holdid` int(11) NOT NULL auto_increment,
  `navn` varchar(20) NOT NULL default '',
  `oprettelsesdato` date NOT NULL default '1979-01-01',
  `profilid` int(11) NOT NULL default 0,
  `kredit` int(11) NOT NULL default 0,
  PRIMARY KEY  (`holdid`),
  UNIQUE KEY `navn` (`navn`),
  KEY `FK_hold_profil` (`profilid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 3072 kB' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `klub`
--

DROP TABLE IF EXISTS `klub`;
CREATE TABLE IF NOT EXISTS `klub` (
  `klubid` int(11) NOT NULL auto_increment,
  `xmlid` varchar(20) NOT NULL default '',
  `navn` varchar(50) NOT NULL default '',
  `unionid` int(11) default 0,
  PRIMARY KEY  (`klubid`),
  UNIQUE KEY `xmlid` (`xmlid`),
  UNIQUE KEY `navn` (`navn`),
  KEY `FK_klub_union` (`unionid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `liga`
--

DROP TABLE IF EXISTS `liga`;
CREATE TABLE IF NOT EXISTS `liga` (
  `ligaid` int(11) NOT NULL auto_increment,
  `navn` varchar(50) NOT NULL default '',
  `turneringid` int(11) NOT NULL default 0,
  `oprettelsesdato` date NOT NULL default '1979-01-01',
  `profilid` int(11) NOT NULL default 0 COMMENT 'Administrator for liga',
  `privat` tinyint(1) NOT NULL default 0,
  `password` varchar(255) default NULL,
  PRIMARY KEY  (`ligaid`,`profilid`),
  UNIQUE KEY `navn` (`navn`),
  KEY `FK_liga_turnering` (`turneringid`),
  KEY `FK_liga_profil` (`profilid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `ligadeltager`
--

DROP TABLE IF EXISTS `ligadeltager`;
CREATE TABLE IF NOT EXISTS `ligadeltager` (
  `ligadeltagerid` int(11) NOT NULL auto_increment,
  `ligaid` int(11) NOT NULL default 0,
  `holdid` int(11) NOT NULL default 0,
  PRIMARY KEY  (`ligadeltagerid`),
  KEY `FK_ligadeltager_liga` (`ligaid`),
  KEY `FK_ligadeltager_hold` (`holdid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `profil`
--

DROP TABLE IF EXISTS `profil`;
CREATE TABLE IF NOT EXISTS `profil` (
  `profilid` int(11) NOT NULL auto_increment,
  `fornavn` varchar(10) NOT NULL default '',
  `efternavn` varchar(30) NOT NULL default '0',
  `email` varchar(50) NOT NULL default '',
  `password` varchar(255) NOT NULL default '',
  `sidstelogin` date default null,
  `profiloprettet` timestamp(14) default current_timestamp,
  `sikkerhedsspr` varchar(255) NOT NULL default '',
  `sikkerhedssvar` varchar(255) NOT NULL default '',
  `klubid` int(11) default null,
  `aktiveringsNoegle` varchar(255) default null,
  PRIMARY KEY  (`profilid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `rating`
-- Kolonnen prevrating er tilføjet pga. performance.
-- Den opdateres ved hver rating update så den aktuelle
-- status for spiller nemt kan tilgås.
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `ratingid` int(11) NOT NULL auto_increment,
  `rating` int(11) NOT NULL default 0,
  `spillerid` int(11) NOT NULL default 0,
  `ratingopdateringid` int(11) NOT NULL default 0,
  `klubid` int(11) default 0,
  PRIMARY KEY  (`ratingid`),
  UNIQUE KEY `IDX_RATING_UPDATE` (`spillerid`,`ratingopdateringid`),
  KEY `FK_rating_klub` (`klubid`),
  KEY `FK_rating_ratingopdatering` (`ratingopdateringid`),
  KEY `FK_rating_spiller` (`spillerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `ratingopdatering`
--

DROP TABLE IF EXISTS `ratingopdatering`;
CREATE TABLE IF NOT EXISTS `ratingopdatering` (
  `ratingopdateringid` int(11) NOT NULL auto_increment,
  `opdateringsdato` date NOT NULL default '1979-01-01',
  `turneringid` int(11) NOT NULL,
  PRIMARY KEY  (`ratingopdateringid`),
  UNIQUE KEY `opdateringsdato` (`opdateringsdato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `spiller`
--

DROP TABLE IF EXISTS `spiller`;
CREATE TABLE IF NOT EXISTS `spiller` (
  `spillerid` int(11) NOT NULL auto_increment,
  `xmlid` varchar(20) NOT NULL default '',
  `spillernr` varchar(20) NOT NULL default '',
  `navn` varchar(50) NOT NULL default '',
  `koen` varchar(10) NOT NULL default '0',
  `foedselsdato` date NOT NULL default '1979-01-01',
  PRIMARY KEY  (`spillerid`),
  UNIQUE KEY `xmlid` (`xmlid`),
  UNIQUE KEY `spillernr` (`spillernr`),
  KEY `spillernavn` (`navn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


--
-- Struktur-dump for tabellen `spillerturnering_stat`
-- Indeholder statistik for spillere som er specifik
-- for en turnering. 
--

DROP TABLE IF EXISTS `stat_spillerturnering`;
CREATE TABLE IF NOT EXISTS `stat_spillerturnering` (
  `stat_spillerturneringid` int(11) NOT NULL auto_increment,
  `spillerid` int(11) NOT NULL,
  `turneringid`int(11) NOT NULL,
  `antalgangesolgt` int(11) default 0,
  `antalgangekoebt` int(11) default 0,
  PRIMARY KEY  (`stat_spillerturneringid`),
  UNIQUE KEY `IDX_STAT_SPILLERTURN` (`spillerid`,`turneringid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------
-- Generelt for stat_* tabellerne er at de indeholder den forskel
-- der er fra den forrige ratingopdatering til den seneste. 
-- Disse tabeller er oprettet til nemt at kunne forespørge statistik
-- på spillere, hold, ligaer.

-- Struktur-dump for tabellen `stats_spiller`
-- Tabel for indsamling af statistik for de enkelte spillere
-- for en turnering.
-- ratingstatus, angiver hvor meget spilleren er gået frem eller tilbage efter den sidste rating opdatering.
-- antalgangekoebt, angiver hvor mange gange spilleren er købt i den aktuelle turnering.

DROP TABLE IF EXISTS `stat_spiller`;
CREATE TABLE IF NOT EXISTS `stat_spiller` (
  `stat_spillerid` int(11) NOT NULL auto_increment,
  `spillerid` int(11) NOT NULL,
  `ratingstatus` int(11) default 0 COMMENT 'Angiver spillerens frem- eller tilbage-gang siden sidste ratingopdatering',
  `kreditstatus` int(11) default 0 NOT NULL COMMENT 'Angiver spillerens frem-eller tilbage-gang i pris siden sidste ratingopdatering',
  `ratingopdateringid` int(11) NOT NULL,
  PRIMARY KEY  (`stat_spillerid`),
  UNIQUE KEY `IDX_STAT_SPILLER` (`ratingopdateringid`,`spillerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `stat_hold`
-- Registrering af frem- eller tilbage-gang for et hold.
-- Ratingstatus udregnes udfra holdets spillere.

DROP TABLE IF EXISTS `stat_hold`;
CREATE TABLE IF NOT EXISTS `stat_hold` (
  `stat_holdid` int(11) NOT NULL auto_increment,
  `holdid` int(11) NOT NULL,
  `ratingopdateringid` int(11) NOT NULL,
  `ratingstatus` int(11) default 0,
  `kreditstatus` int(11) default 0,
  `placering` int(11) default 0 NOT NULL COMMENT 'Holdets aktuelle placering. Tages med for ikke skulle udregne placering hvergang.',
  PRIMARY KEY  (`stat_holdid`),
  UNIQUE KEY `IDX_STAT_HOLD` (`ratingopdateringid`,`holdid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------
--
-- Struktur-dump for tabellen `stat_liga`
-- Registrering af frem- eller tilbage-gang for en liga.
-- Ratingstatus udregnes udfra ligaens hold.
DROP TABLE IF EXISTS `stat_liga`;
CREATE TABLE IF NOT EXISTS `stat_liga` (
  `stat_ligaid` int(11) NOT NULL auto_increment,
  `ligaid` int(11) NOT NULL,
  `ratingopdateringid` int(11) NOT NULL,
  `ratingstatus` int(11) default 0,
  `placering` int(11) default 0 NOT NULL COMMENT 'Ligaens aktuelle placering. Tages med for ikke skulle udregne placering hvergang.',
  PRIMARY KEY  (`stat_ligaid`),
  UNIQUE KEY `IDX_STAT_LIGA` (`ratingopdateringid`,`ligaid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


-- --------------------------------------------------------
--
-- Struktur-dump for tabellen `stat_ligadeltager`
--

DROP TABLE IF EXISTS `stat_ligadeltager`;
CREATE TABLE IF NOT EXISTS `stat_ligadeltager` (
  `stat_ligadeltagerid` int(11) NOT NULL auto_increment,
  `ligadeltagerid` int(11) NOT NULL,
  `ratingopdateringid` int(11) NOT NULL,
  `placering` int(6) COMMENT 'Holdets aktuelle placering i den relevante liga.',
  PRIMARY KEY  (`stat_ligadeltagerid`),
  UNIQUE KEY `IDX_STAT_LIGADELTAGER` (`ligadeltagerid`,`ratingopdateringid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
-- --------------------------------------------------------
--
-- Struktur-dump for tabellen `tilmeldt`
--

DROP TABLE IF EXISTS `tilmeldt`;
CREATE TABLE IF NOT EXISTS `tilmeldt` (
  `tilmeldtid` int(11) NOT NULL auto_increment,
  `holdid` int(11) NOT NULL default '0',
  `spillerid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`tilmeldtid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------
--
-- Struktur-dump for tabellen `pris_klasse`
--
DROP TABLE IF EXISTS `pris_klasse`;
CREATE TABLE `pris_klasse` (
  `prisklasseid` int(11) NOT NULL,
  `pris` int(6) NOT NULL,
  PRIMARY KEY  (`prisklasseid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

INSERT INTO `pris_klasse` (`prisklasseid`, `pris`) VALUES
	(1, 500000),
	(2, 400000),
	(3, 300000),
	(4, 200000),
	(5, 100000),
	(6, 50000);

-- --------------------------------------------------------
--
-- Struktur-dump for tabellen `aldersklasse`
-- Tabellen definerer hvilke alderklasser der findes for spillere.
-- Der findes flere aldersklasser defineret af DBTU,
-- (veteran) men disse opdateres ikke med rating.
DROP TABLE IF EXISTS `aldersklasse`;
CREATE TABLE `aldersklasse` (
  `aldersklasseid` int(11) NOT NULL auto_increment,
  `alderFra` smallint(6) NOT NULL,
  `alderTil` smallint(6) NOT NULL,
  PRIMARY KEY  (`aldersklasseid`),
  UNIQUE KEY `alder` (`alderFra`, `alderTil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

INSERT INTO `aldersklasse` (`aldersklasseid`, `alderFra`, `alderTil`) VALUES
  	(1,0,11), #puslinge
  	(2,12,13), #yngre p/d
  	(3,14,15), #pige/dreng
  	(4,16,18), #junior
  	(5,19,21), #u21
  	(6,22,34), #senior
	(7,35,100), #Old boys
	(8,30,100); #Old girls


COMMIT;

-- --------------------------------------------------------
--
-- Struktur-dump for tabellen `licensklasse`
--
DROP TABLE IF EXISTS `licensklasse`;
CREATE TABLE `licensklasse` (
  `klasseid` int(11) NOT NULL auto_increment,
  `klasseNavn` varchar(20) NOT NULL default '',
  `aldersklasseid` int(11) NOT NULL default '0',
  `koen` char(1) NOT NULL default '',
  `minRating` smallint(6) NOT NULL default '0',
  `maxRating` smallint(6) default '0',
  `prisklasseid` int(11) NOT NULL,
  PRIMARY KEY  (`klasseid`),
  UNIQUE KEY `klasseNavn` (`klasseNavn`,`koen`),
  KEY `FK_licenskl_alderskl` (`aldersklasseid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- --------------------------------------------------------
--
-- Data for the `licensklasse` table  (LIMIT 0,500)
--
-- Herre
INSERT INTO `licensklasse` (`klasseid`, `klasseNavn`, `aldersklasseid`, `koen`, `minRating`, `maxRating`, `prisklasseid`) VALUES
	(1, 'Puslinge Drenge D',1,'0',0,949,6),
	(2, 'Puslinge Drenge C',1,'0',950,999,6),
	(3, 'Puslinge Drenge B',1,'0',1000,1049,6),
	(4, 'Puslinge Drenge A',1,'0',1050,9999,5),
	(5, 'Yngre Drenge C',2,'0',1000,1099,6),
	(6, 'Yngre Drenge B',2,'0',1100,1199,6),
	(7, 'Yngre Drenge A',2,'0',1200,9999,5),
	(8, 'Drenge D',3,'0',0,1049,6),
	(9, 'Drenge C',3,'0',1050,1149,6),
	(10, 'Drenge B',3,'0',1150,1449,5),
	(11, 'Drenge A',3,'0',1450,9999,4),
	(12, 'Herre Junior C',4,'0',0,1249,6),
	(13, 'Herre Junior B',4,'0',1250,1649,3),
	(14, 'Herre Junior A',4,'0',1650,9999,2),
	(15, 'U21 B',5,'0',0,1999, 3),
	(16, 'U21 A',5,'0',2000,9999, 2),
	(17, 'Klasse 5',6,'0',0,1299, 6),
	(18, 'Klasse 4',6,'0',1300,1499,5),
	(19, 'Klasse 3',6,'0',1500,1699,4),
	(20, 'Klasse 2',6,'0',1700,1999,3),
	(21, 'Klasse 1',6,'0',2000,2299,2),
	(22, 'Elite',6,'0',2300,9999,1),
	(23, 'Old Boys C',7,'0',0,1499,6),
	(24, 'Old Boys B',7,'0',1500,1699,6),
	(25, 'Old Boys A',7,'0',1700,9999,6);

-- Dame
INSERT INTO `licensklasse` (`klasseid`, `klasseNavn`, `aldersklasseid`, `koen`, `minRating`, `maxRating`, `prisklasseid`) VALUES
	(26, 'Puslinge Pige',1,'1',0,9999,6),
	(27, 'Yngre Pige B',2,'1',0,1049,6),
	(28, 'Yngre Pige A',2,'1',1050,9999,5),
	(29, 'Pige B',3,'1',0,1149,6),
	(30, 'Pige A',3,'1',1150,9999,5),
	(31, 'Dame Junior B',4,'1',0,1249,6),
	(32, 'Dame Junior A',4,'1',1250,9999,5),
	(33, 'U21',5,'1',0,9999,2),
	(34, 'Klasse 4',6,'1',0,1099,5),
	(35, 'Klasse 3',6,'1',1100,1249,4),
	(36, 'Klasse 2',6,'1',1250,1499,3),
	(37, 'Klasse 1',6,'1',1500,1749,2),
	(38, 'Elite',6,'1',1750,9999,1),
	(39, 'Old Girls',8,'1',0,9999,6);
COMMIT;


-- --------------------------------------------------------
--
-- Struktur-dump for tabellen `sys_points`
-- Angiver hvor stor en point mæssig tilbage eller fremgang 
-- en spiller skal have alt efter hvor mange rating point
-- spilleren har haft. 
DROP TABLE IF EXISTS `sys_points`;
CREATE TABLE IF NOT EXISTS `sys_points` (
  `sys_pointsid` int(11) NOT NULL auto_increment,
  `fra` int(11) NOT NULL,
  `til` int(11) NOT NULL,
  `kredit` int(11) NOT NULL,
  PRIMARY KEY  (`sys_pointsid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

INSERT INTO `sys_points` (`fra`, `til`, `kredit`) VALUES
('-10000', '-30', '-30000'),
('-29', '-20', '-20000'),
('-19', '-10', '-15000'),
('-9', '0', '-10000'),
('1', '10', '10000'),
('11', '15', '15000'),
('21', '30', '20000'),
('31', '10000', '30000');

-- --------------------------------------------------------
--
-- Data for the `turnering` table
--
INSERT INTO `turnering` ( `turneringid` , `turneringnavn` , `turneringstart` , `turneringslut`, `aktuelturnering` )
VALUES ('1', 'Sæson 2005-2006', '2005-07-01', '2006-07-01', 1);

COMMIT;

-- --------------------------------------------------------
--
-- Data for the `profil` table
--
INSERT INTO `profil` VALUES 
(1, 'Test', 'Test', 'test@test.dk', '098F6BCD4621D373CADE4E832627B4F6', '2007-07-22', '2007-07-22 21:36:30', 'test', 'test', NULL, NULL);

COMMIT;

-- --------------------------------------------------------
--
-- Views
--

-- Vis den seneste ratingopdatering
DROP VIEW IF EXISTS `ratingopdatering_h`;
CREATE VIEW `ratingopdatering_h` AS
	select
		ratingopdateringid
	from
		ratingopdatering
	order by
		opdateringsdato desc
	limit 1;
	
DROP VIEW IF EXISTS `liga_v`;
CREATE VIEW `liga_v` AS
	SELECT 
		l.ligaid,
  		l.navn,
  		l.turneringid,
  		l.oprettelsesdato,
  		l.profilid,
  		l.privat,
  		l.password,
  		sl.ratingopdateringid,
  		sl.placering
	FROM liga l
	JOIN stat_liga sl ON sl.ligaid = l.ligaid
	WHERE sl.ratingopdateringid IN
		(SELECT ratingopdateringid FROM ratingopdatering_h)
	ORDER BY sl.placering ASC;

DROP VIEW IF EXISTS `licensklasse_v`;
CREATE VIEW `licensklasse_v` AS
  select
    lk.klasseid AS `klasseid`,
    lk.klasseNavn AS `klasseNavn`,
    lk.koen AS `koen`,
    lk.minRating AS `minRating`,
    lk.maxRating AS `maxRating`,
    pk.pris AS `pris`,
    ak.alderFra AS `alderFra`,
    ak.alderTil AS `alderTil`
  from
    `licensklasse` lk
    join `aldersklasse` ak on ak.`aldersklasseid` = lk.`aldersklasseid`
    join `pris_klasse` pk on pk.prisklasseid = lk.prisklasseid;

DROP VIEW IF EXISTS `spiller_alder`;
CREATE VIEW `spiller_alder` AS
	select
		s.spillerid,
		(SELECT DATE_FORMAT(NOW(), '%Y') - DATE_FORMAT(s.foedselsdato, '%Y') - (DATE_FORMAT(NOW(), '00-%m-%d') < DATE_FORMAT(s.foedselsdato, '00-%m-%d'))) AS alder
	from
		spiller s;


DROP VIEW IF EXISTS `spiller_v`;
CREATE VIEW `spiller_v` AS
		select
			s.spillerid,
			s.xmlid,
			s.spillernr,
			s.navn,
			s.koen,
			s.foedselsdato,
			sa.alder,
			r.ratingopdateringid,
      		r.rating,
      		lk.pris,
			k.klubid,
			sst.antalgangekoebt,
			sst.antalgangesolgt,
			ss.ratingstatus
		from
			spiller s
			join spiller_alder sa on sa.spillerid = s.spillerid
			join rating r on s.spillerid = r.spillerid and r.ratingopdateringid in (select ratingopdateringid from ratingopdatering_h)
			join klub k on r.klubid = k.klubid
			join licensklasse_v lk on lk.minRating <= r.rating
				and r.rating <= lk.maxRating
				and lk.alderFra <= sa.alder
				and sa.alder <= lk.alderTil
				and lk.koen = s.koen
			left outer join stat_spiller ss on s.spillerid = ss.spillerid
			left outer join stat_spillerturnering sst on sst.spillerid = s.spillerid;


DROP VIEW IF EXISTS `hold_v`;
CREATE VIEW `hold_v` AS
	select
		h.holdid,
		h.navn,
		h.oprettelsesdato,
		concat(p.fornavn, ' ', p.efternavn) as adminnavn,
		h.kredit,
		hp.points,
		ru.opdateringsdato
	from
		hold h
		join profil p on h.profilid = p.profilid
		join holdpoint hp on h.holdid = hp.holdid
		join ratingopdatering ru on hp.ratingopdateringid = ru.ratingopdateringid
	where
		hp.ratingopdateringid IN
		(select ratingopdateringid from ratingopdatering_h);

--
-- Procedures
--
delimiter|

drop procedure if exists updateAllStats|
create procedure updateAllStats()
LANGUAGE SQL
MODIFIES SQL DATA
COMMENT 'Update all stats in the correct order'
BEGIN
	CALL updateSpillerRatingStat();
	CALL updateHoldRatingStat();
	CALL updateLigaRatingStat();
--	CALL updateLigaDeltagerStat();
	
END|

drop procedure if exists updateSpillerRatingStat|
create procedure updateSpillerRatingStat()
LANGUAGE SQL
MODIFIES SQL DATA
COMMENT 'Update statement for opdatering af spillerrating 2*seneste rating - (seneste rating + forrige rating) = frem- eller tilbage-gang i rating'
BEGIN
	declare ratingopdatering_id int(11);
	
	-- Vælg den seneste ratingopdatering
	select ratingopdateringid
	into ratingopdatering_id
	from ratingopdatering_h;
	
	-- Insert statistik rækker for spillere. Ignorer hvis der allerede findes en række.
	insert ignore into stat_spiller
		(spillerid, ratingstatus, ratingopdateringid)
		(select spillerid, 0, ratingopdatering_id from spiller);

	-- Opdater statistik rækker for alle spillere. Dvs. frem- eller tilbage-gang i rating sidstn sidste opdatering.
	update stat_spiller ss set ratingstatus=
		((select 2*r.rating
		from rating r
		where r.spillerid = ss.spillerid
			and r.ratingopdateringid = ratingopdatering_id)
		-
		(select sum(r.rating)
		from rating r
		join (
		select ro.ratingopdateringid
		from ratingopdatering ro
		order by ro.opdateringsdato desc limit 2) ro on ro.ratingopdateringid = r.ratingopdateringid
		where r.spillerid = ss.spillerid))
	where ss.ratingopdateringid = ratingopdatering_id;
	
	-- Indsæt række i tabel der angiver hvor meget prisen på spilleren
	-- er gået ned eller op siden sidste ratingopdatering.
	UPDATE stat_spiller ss SET ss.kreditstatus =
	 (SELECT sp.kredit from sys_points sp
	 WHERE sp.fra <= ss.ratingstatus AND sp.til >= ss.ratingstatus)
	 WHERE ss.ratingopdateringid=ratingopdatering_id;

END|

drop procedure if exists updateHoldRatingStat|
create procedure updateHoldRatingStat()
LANGUAGE SQL
MODIFIES SQL DATA
COMMENT 'For alle spillere på et sammensat hold, summér deres ratingtals frem- eller tilbage-gang'
BEGIN
	declare ratingopdatering_id int(11);

	-- Vælg den seneste ratingopdatering
	select ratingopdateringid
	into ratingopdatering_id
	from ratingopdatering_h;

	-- Drop alle eventuelle eksisterende statistik rækker for det aktuelle ratingopdatering
	delete from stat_hold where ratingopdateringid = ratingopdatering_id;

	-- Indsæt rating statistik for hold
	insert into stat_hold (holdid, ratingopdateringid, ratingstatus)
		(select t.holdid, ratingopdatering_id, sum(ratingstatus) from tilmeldt t
		join stat_spiller ss on ss.spillerid = t.spillerid
		group by t.holdid);

	-- Indsæt point statistik for hold		
	update stat_hold sh set sh.kreditstatus = 
		(SELECT sum(ss.kreditstatus)
			FROM tilmeldt t
				JOIN stat_spiller ss ON ss.spillerid = t.spillerid
			WHERE t.holdid = sh.holdid
				AND ss.ratingopdateringid=ratingopdatering_id);

	-- Opdater placering for holdene
	update stat_hold sh set sh.placering =
   		(select @rownum:=@rownum+1 placering from (select @rownum:=0) r)
		where sh.ratingopdateringid = ratingopdatering_id order by sh.ratingstatus desc;
END|

drop procedure if exists updateLigaRatingStat|
create procedure updateLigaRatingStat()
LANGUAGE SQL
MODIFIES SQL DATA
COMMENT 'For alle hold i en liga, summér deres ratingtals frem- eller tilbage-gang, samt ligaens samlede placering'
BEGIN
	declare ratingopdatering_id int(11);

	-- Vælg den seneste ratingopdatering
	select ratingopdateringid
	into ratingopdatering_id
	from ratingopdatering_h;

	-- Drop alle eventuelle eksisterende statistik rækker for det aktuelle ratingopdatering
	delete from stat_liga where ratingopdateringid = ratingopdatering_id;

	-- Indsæt statistik for liga
	insert into stat_liga (ligaid, ratingopdateringid, ratingstatus)
		(select ld.ligaid, ratingopdatering_id, sum(ratingstatus) from ligadeltager ld
		join stat_hold sh on sh.holdid = ld.holdid
		group by ld.ligaid);

	-- 	Opdater placering for liga
	update stat_liga sl set sl.placering =
   		(select @rownum:=@rownum+1 placering from (select @rownum:=0) r)
		where sl.ratingopdateringid = ratingopdatering_id order by sl.ratingstatus desc;
END|

drop procedure if exists updateLigaDeltagerStat|
create procedure updateLigaDeltagerStat()
LANGUAGE SQL
MODIFIES SQL DATA
COMMENT 'For alle hold i en liga, angiv deres placering i ligaen'
BEGIN
	declare ratingopdatering_id int(11);

	-- Vælg den seneste ratingopdatering
	select ratingopdateringid
	into ratingopdatering_id
	from ratingopdatering_h;

	-- Drop alle eventuelle eksisterende statistik rækker for det aktuelle ratingopdatering
	delete from stat_ligadeltager where ratingopdateringid = ratingopdatering_id;

	-- Indsæt statistik for ligadeltager
	insert into stat_ligadeltager (ligadeltagerid, ratingopdateringid)
		(select ld.ligadeltagerid, ratingopdatering_id from ligadeltager ld);

	INSERT INTO stat_ligadeltager (ligadertagerid, ratingopdateringid, placering)
		(SELECT @rownum:=@rownum+1 placering, sh.holdid
		FROM (select @rownum:=0) r,
		stat_hold sh
		where ratingopdateringid=3 order by kreditstatus desc, ratingstatus desc);

	-- Opdater placering for hold, i liga
	update stat_ligadeltager sl set sl.placering =
   		(select @rownum:=@rownum+1 placering)
		where sl.ratingopdateringid = ratingopdatering_id 
		order by sl.kreditstatus desc, sl.ratingstatus desc;
		
END|

delimiter ;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `licensklasse`
--
ALTER TABLE `licensklasse`
  ADD CONSTRAINT `FK_licenskl_alderskl` FOREIGN KEY (`aldersklasseid`) REFERENCES `aldersklasse` (`aldersklasseid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_licenskl_priskl` FOREIGN KEY (`prisklasseid`) REFERENCES `pris_klasse` (`prisklasseid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrænsninger for tabel `hold`
--
ALTER TABLE `hold`
  ADD CONSTRAINT `FK_hold_profil ` FOREIGN KEY (`profilid`) REFERENCES `profil` (`profilid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrænsninger for tabel `klub`
--
ALTER TABLE `klub`
  ADD CONSTRAINT `FK_klub_union` FOREIGN KEY (`unionid`) REFERENCES `btunion` (`unionid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrænsninger for tabel `liga`
--
ALTER TABLE `liga`
  ADD CONSTRAINT `FK_liga_profil` FOREIGN KEY (`profilid`) REFERENCES `profil` (`profilid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_liga_turnering` FOREIGN KEY (`turneringid`) REFERENCES `turnering` (`turneringid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrænsninger for tabel `ligadeltager`
--
ALTER TABLE `ligadeltager`
  ADD CONSTRAINT `FK_ligadeltager_hold` FOREIGN KEY (`holdid`) REFERENCES `hold` (`holdid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ligadeltager_liga` FOREIGN KEY (`ligaid`) REFERENCES `liga` (`ligaid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrænsninger for tabel `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `FK_rating_klub` FOREIGN KEY (`klubid`) REFERENCES `klub` (`klubid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_rating_ratingopdatering` FOREIGN KEY (`ratingopdateringid`) REFERENCES `ratingopdatering` (`ratingopdateringid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_rating_spiller` FOREIGN KEY (`spillerid`) REFERENCES `spiller` (`spillerid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrænsninger for tabel `ratingopdatering`
--
ALTER TABLE `liga`
  ADD CONSTRAINT `FK_ro_turnering` FOREIGN KEY (`turneringid`) REFERENCES `turnering` (`turneringid`) ON DELETE CASCADE ON UPDATE CASCADE;


--
-- Begrænsninger for tabel `tilmeldt`
--
ALTER TABLE `tilmeldt`
  ADD CONSTRAINT `FK_tilmeldt_hold` FOREIGN KEY (`holdid`) REFERENCES `hold` (`holdid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tilmeldt_spiller` FOREIGN KEY (`spillerid`) REFERENCES `spiller` (`spillerid`) ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO `btunion` (`unionid`, `navn`) VALUES
  (3,'BBTU'),
  (4,'FBTU'),
  (2,'JBTU'),
  (1,'ØBTU');

COMMIT;

--
-- Begrænsninger for tabel `stat_spiller`
--
ALTER TABLE `stat_spiller`
  ADD CONSTRAINT `FK_sps_spiller` FOREIGN KEY (`spillerid`) REFERENCES `spiller` (`spillerid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_sps_ratingopdatering` FOREIGN KEY (`ratingopdateringid`) REFERENCES `ratingopdatering` (`ratingopdateringid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrænsninger for tabel `stat_spillerturnering`
--
ALTER TABLE `stat_spillerturnering`
  ADD CONSTRAINT `FK_spst_spiller` FOREIGN KEY (`spillerid`) REFERENCES `spiller` (`spillerid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_spst_turnering` FOREIGN KEY (`turneringid`) REFERENCES `ratingopdatering` (`turneringid`) ON DELETE CASCADE ON UPDATE CASCADE;


--
-- Begrænsninger for tabel `stat_hold`
--
ALTER TABLE `stat_hold`
  ADD CONSTRAINT `FK_hs_ratingopdatering` FOREIGN KEY (`ratingopdateringid`) REFERENCES `ratingopdatering` (`ratingopdateringid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_hs_hold` FOREIGN KEY (`holdid`) REFERENCES `hold` (`holdid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrænsninger for tabel `stat_liga`
--
ALTER TABLE `stat_liga`
  ADD CONSTRAINT `FK_ls_ratingopdatering` FOREIGN KEY (`ratingopdateringid`) REFERENCES `ratingopdatering` (`ratingopdateringid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ls_liga` FOREIGN KEY (`ligaid`) REFERENCES `liga` (`ligaid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrænsninger for tabel `stat_ligadeltager`
--
ALTER TABLE `stat_ligadeltager`
  ADD CONSTRAINT `FK_sld_ligadeltager` FOREIGN KEY (`ligadeltagerid`) REFERENCES `ligadeltager` (`ligadeltagerid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_sld_ratingopdatering` FOREIGN KEY (`ratingopdateringid`) REFERENCES `ratingopdatering` (`ratingopdateringid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrænsninger for tabel `holdpoint`
--
ALTER TABLE `holdpoint`
  ADD CONSTRAINT `FK_hp_ratopdt` FOREIGN KEY (`ratingopdateringid`) REFERENCES `ratingopdatering` (`ratingopdateringid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_hp_hold` FOREIGN KEY (`holdid`) REFERENCES `hold` (`holdid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrænsninger for tabel `spillerpoint`
--
ALTER TABLE `spillerpoint`
  ADD CONSTRAINT `FK_sp_ratopdt` FOREIGN KEY (`ratingopdateringid`) REFERENCES `ratingopdatering` (`ratingopdateringid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_sp_spiller` FOREIGN KEY (`spillerid`) REFERENCES `spiller` (`spillerid`) ON DELETE CASCADE ON UPDATE CASCADE;
  