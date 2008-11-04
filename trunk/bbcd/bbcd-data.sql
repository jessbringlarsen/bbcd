
delete from license_class_price;
INSERT INTO license_class_price(id, version, price) VALUES
	(1, 0, 500000),
	(2, 0, 400000),
	(3, 0, 300000),
	(4, 0, 200000),
	(5, 0, 100000),
	(6, 0, 50000);

delete from license_class;
INSERT INTO license_class (id, version, class_name, gender, min_rating, max_rating, price_id) VALUES
	(1, 0, 'Puslinge Drenge D', '0',0,    949,6),
	(2, 0, 'Puslinge Drenge C', '0',950,  999,6),
 	(3, 0, 'Puslinge Drenge B', '0',1000, 1049,6),
	(4, 0, 'Puslinge Drenge A', '0',1050, 9999,5),
    (5, 0, 'Yngre Drenge C',    '0',1000, 1099,6),
	(6, 0, 'Yngre Drenge B',    '0',1100, 1199,6),
	(7, 0, 'Yngre Drenge A',    '0',1200, 9999,5),
	(8, 0, 'Drenge D',          '0',0,    1049,6),
	(9, 0, 'Drenge C',          '0',1050, 1149,6),
	(10, 0, 'Drenge B',         '0',1150, 1449,5),
	(11, 0, 'Drenge A',         '0',1450, 9999,4),
	(12, 0, 'Herre Junior C',   '0',0,    1249,6),
	(13, 0, 'Herre Junior B',   '0',1250, 1649,3),
	(14, 0, 'Herre Junior A',   '0',1650, 9999,2),
	(15, 0, 'U21 B',            '0',0,    1999,3),
	(16, 0, 'U21 A',            '0',2000, 9999,2),
	(17, 0, 'Klasse 5',         '0',0,    1299,6),
	(18, 0, 'Klasse 4',         '0',1300, 1499,5),
	(19, 0, 'Klasse 3',         '0',1500, 1699,4),
	(20, 0, 'Klasse 2',         '0',1700, 1999,3),
	(21, 0, 'Klasse 1',         '0',2000, 2299,2),
	(22, 0, 'Elite',            '0',2300, 9999,1),
	(23, 0, 'Old Boys C',       '0',0,    1499,6),
	(24, 0, 'Old Boys B',       '0',1500, 1699,6),
	(25, 0, 'Old Boys A',       '0',1700, 9999,6);

-- Dame
INSERT INTO license_class (id, version, class_name, gender, min_rating, max_rating, price_id) VALUES
	(26, 0, 'Puslinge Pige',    '1',0,9999,6),
	(27, 0, 'Yngre Pige B',     '1',0,1049,6),
	(28, 0, 'Yngre Pige A',     '1',1050,9999,5),
	(29, 0, 'Pige B',           '1',0,1149,6),
	(30, 0, 'Pige A',           '1',1150,9999,5),
	(31, 0, 'Dame Junior B',    '1',0,1249,6),
	(32, 0, 'Dame Junior A',    '1',1250,9999,5),
	(33, 0, 'U21',              '1',0,9999,2),
	(34, 0, 'Klasse 4',         '1',0,1099,5),
	(35, 0, 'Klasse 3',         '1',1100,1249,4),
	(36, 0, 'Klasse 2',         '1',1250,1499,3),
	(37, 0, 'Klasse 1',         '1',1500,1749,2),
	(38, 0, 'Elite',            '1',1750,9999,1),
	(39, 0, 'Old Girls',        '1',0,9999,6);