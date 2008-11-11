
delete from license_class_price;
INSERT INTO license_class_price(id, version, price) VALUES
	(1, 0, 500000),
	(2, 0, 400000),
	(3, 0, 300000),
	(4, 0, 200000),
	(5, 0, 100000),
	(6, 0, 50000);

delete from license_class;
INSERT INTO license_class (id, version, class_name, gender, min_rating, max_rating, price_id, age_id) VALUES
	(1, 0, 'Puslinge Drenge D', '0',0,    949, 6, 1),
	(2, 0, 'Puslinge Drenge C', '0',950,  999, 6, 1),
 	(3, 0, 'Puslinge Drenge B', '0',1000, 1049, 6, 1),
	(4, 0, 'Puslinge Drenge A', '0',1050, 9999, 5, 1),
    (5, 0, 'Yngre Drenge C',    '0',1000, 1099, 6, 2),
	(6, 0, 'Yngre Drenge B',    '0',1100, 1199, 6, 2),
	(7, 0, 'Yngre Drenge A',    '0',1200, 9999, 5, 2),
	(8, 0, 'Drenge D',          '0',0,    1049, 6, 3),
	(9, 0, 'Drenge C',          '0',1050, 1149, 6, 3),
	(10, 0, 'Drenge B',         '0',1150, 1449, 5, 3),
	(11, 0, 'Drenge A',         '0',1450, 9999, 4, 3),
	(12, 0, 'Herre Junior C',   '0',0,    1249, 6, 4),
	(13, 0, 'Herre Junior B',   '0',1250, 1649, 3, 4),
	(14, 0, 'Herre Junior A',   '0',1650, 9999, 2, 4),
	(15, 0, 'Herre U21 B',      '0',0,    1999, 3, 5),
	(16, 0, 'Herre U21 A',      '0',2000, 9999, 2, 5),
	(17, 0, 'Herre Klasse 5',   '0',0,    1299, 6, 6),
	(18, 0, 'Herre Klasse 4',   '0',1300, 1499, 5, 6),
	(19, 0, 'Herre Klasse 3',   '0',1500, 1699, 4, 6),
	(20, 0, 'Herre Klasse 2',   '0',1700, 1999, 3, 6),
	(21, 0, 'Herre Klasse 1',   '0',2000, 2299, 2, 6),
	(22, 0, 'Herre Elite',      '0',2300, 9999, 1, 6),
	(23, 0, 'Old Boys C',       '0',0,    1499, 6, 7),
	(24, 0, 'Old Boys B',       '0',1500, 1699, 6, 7),
	(25, 0, 'Old Boys A',       '0',1700, 9999, 6, 7);

-- Dame
INSERT INTO license_class (id, version, class_name, gender, min_rating, max_rating, price_id, age_id) VALUES
	(26, 0, 'Puslinge Pige',    '1',0,      9999, 6, 1),
	(27, 0, 'Yngre Pige B',     '1',0,      1049, 6, 2),
	(28, 0, 'Yngre Pige A',     '1',1050,   9999, 5, 2),
	(29, 0, 'Pige B',           '1',0,      1149, 6, 3),
	(30, 0, 'Pige A',           '1',1150,   9999, 5, 3),
	(31, 0, 'Dame Junior B',    '1',0,      1249, 6, 4),
	(32, 0, 'Dame Junior A',    '1',1250,   9999, 5, 4),
	(33, 0, 'Dame U21',         '1',0,      9999, 2, 5),
	(34, 0, 'Dame Klasse 4',    '1',0,      1099, 5, 6),
	(35, 0, 'Dame Klasse 3',    '1',1100,   1249, 4, 6),
	(36, 0, 'Dame Klasse 2',    '1',1250,   1499, 3, 6),
	(37, 0, 'Dame Klasse 1',    '1',1500,   1749, 2, 6),
	(38, 0, 'Dame Elite',       '1',1750,   9999, 1, 6),
	(39, 0, 'Old Girls',        '1',0,      9999, 6, 8);