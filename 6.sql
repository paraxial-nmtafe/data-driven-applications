DROP DATABASE if exists tafe;
CREATE DATABASE tafe;

USE tafe;

CREATE TABLE if NOT EXISTS students (
id BIGINT PRIMARY KEY AUTO_INCREMENT,
student_number VARCHAR(255),
first_name VARCHAR(255),
last_name VARCHAR(255),
date_of_birth DATE,
address VARCHAR(255),
gender_identity CHAR(1)
);

CREATE TABLE if NOT EXISTS classes (
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(255),
	`code` VARCHAR(255)
);

CREATE TABLE if NOT EXISTS enrolments (
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	class_id BIGINT NOT null,
	student_id BIGINT NOT NULL,
	FOREIGN KEY(class_id) REFERENCES classes(id),
	FOREIGN KEY(student_id) REFERENCES students(id)
);

DESCRIBE students;
DESCRIBE classes;
DESCRIBE enrolments;

INSERT INTO students
	(student_number, first_name, last_name, address, date_of_birth, gender_identity)
VALUES
('20763645','Anna','Byrd','372 Rodney Frontage, Dustinstad, SA, 2636','1960-09-10', 'F'),
('JWSS4UPL','Cody','Green','Unit 91 2 Webster Siding, Frostmouth, ACT, 4671','1997-02-11', 'M'),
('26468093','Jonathan','Beck','8/1 Hunter Upper, North Cheryl, WA, 2071','1970-10-12', 'X'),
('22832136','Sonya','Mcgee','0 John Upper, North Richard, QLD, 2939','2002-08-12', 'X'),
('J3SM1PEP','Elizabeth','Lopez','Apt. 239 05 Lyons Villas, Sethport, VIC, 2043','2002-04-22', 'X'),
('27213724','Oscar','Berry','053 Ethan Byway, Patriciahaven, QLD, 4161','1975-10-01', 'X'),
('VWHRY6PM','Paige','Davis','Suite 270 1 Carolyn Meander, Elizabethmouth, WA, 5428','1981-03-16', 'X'),
('V1HV4PTU','Madeline','Wright','Unit 46 45 Stuart Extension, Port Derekstad, NSW, 2945','1967-06-27', 'X'),
('VH01L67N','Amanda','Newman','7/47 Walsh Common, Valdezfurt, WA, 2920','1996-01-23', 'X'),
('JDP2PYLC','Tonya','Wilson','12 Kristina Circle, Port Isaac, NT, 2942','1948-10-05', 'X'),
('21883945','Elizabeth','Simmons','2 Wilson Steps, Lake Curtis, NT, 2910','2000-01-14', 'X'),
('V3L6KXEV','Jessica','Zhang','Apt. 434 91 Kelly Crossway, St. James, TAS, 0828','1941-08-11', 'X'),
('VJ63HQHI','Justin','Bush','Level 8 9 Mosley Lees, Karentown, QLD, 2982','2003-07-06', 'X'),
('24605175','Tyler','Martin','Suite 928 17 Monica Dip, Greershire, NT, 2481','1975-11-06', 'X'),
('JXQFQADT','Jared','Ross','Level 3 5 Kathleen Alleyway, South Lisa, NT, 2129','2000-06-16', 'X'),
('V3WD5QJH','Angela','Hansen','Apt. 260 004 Anthony Green, North Charlestown, VIC, 9231','1952-06-06', 'X'),
('VC1WXVWA','Victoria','Byrd','Flat 31 97 Potts Point, Lake Tonyaburgh, WA, 5122','1968-02-27', 'X'),
('JPT9PXN5','Scott','Hamilton','Level 3 46 Tyler Lower, Sharonbury, QLD, 2619','1967-12-25', 'X'),
('JG89PCPE','Tyler','Sharp','Apt. 009 91 Luke Pathway, South Nicholas, NT, 2668','1958-01-24', 'X'),
('JEECEDQR','Angela','Parrish','69/66 Pennington Brae, East Kenneth, WA, 2282','1960-03-18', 'X'),
('VG90WP7D','Emily','Gonzalez','Unit 42 27 Ashley Quad, Laurachester, NT, 0939','2002-02-02', 'F'),
('VD0RT77N','Katherine','Best','144 Lawrence Extension, Port Jennifer, VIC, 2932','1958-02-12', 'X'),
('V9OXYCOP','Michelle','Roberts','24/66 Miller Circle, Donaldmouth, NSW, 2061','1990-10-06', 'X'),
('VHZUMAMR','Katrina','Tyler','Unit 83 5 Jennifer Close, Stephenfurt, TAS, 2617','1947-12-03', 'X'),
('JAFH3984','Melissa','Gonzalez','5 Huerta Riviera, Liuton, WA, 2818','1997-06-25', 'X'),
('J53VQAGV','Sarah','Meyer','7 Hunter Part, Taylorview, ACT, 2695','1952-10-23', 'F'),
('VS3WFE6Q','Joseph','Garcia','5 Daniels Esplanade, Cabrerafort, ACT, 2920','1989-07-11', 'X'),
('VDOAVOB8','Brandon','Gonzalez','Level 9 2 Cynthia Cross, Port Carly, NT, 2619','1957-07-22', 'X'),
('V6C89Y60','Amanda','Montgomery','8 Shannon Freeway, West Sherichester, NSW, 2671','2001-07-21', 'X'),
('JVU621AQ','Elizabeth','Vargas','Flat 26 597 Frederick Wynd, Walkerside, VIC, 2661','1947-08-28', 'X'),
('JERR1PL7','Sarah','Smith','60 Shirley Mall, New Virginia, WA, 6901','1970-10-12', 'X'),
('J4BX3RB0','Linda','Miller','Level 3 1 Sarah Grange, Brittanymouth, WA, 9770','1995-08-18', 'X'),
('22895882','Ashley','Deleon','Apt. 095 91 Kimberly Plaza, East Johnfort, WA, 2755','1984-07-26', 'X'),
('VP58GT6T','Sheri','Blackwell','8 Brock Glade, Allisonland, VIC, 5998','1965-05-27', 'X'),
('VZDQJBCM','William','Davis','Flat 05 54 Kenneth Tarn, Conradstad, WA, 2906','1954-10-09', 'M'),
('VI79QS6D','Amy','Carter','Flat 41 58 Beth Gardens, St. Sharonfort, SA, 1638','1971-10-03', 'X'),
('27084402','Brooke','Gray','9 Cook Vista, New Cherylbury, TAS, 2307','2005-10-15', 'X'),
('J7Y305TT','Sean','Cooper','5/460 Jade Break, West Abigail, ACT, 2368','1946-09-06', 'X'),
('VHDTCJ7R','Jodi','Bauer','2/733 Burns Expressway, Boltonfort, QLD, 2957','1981-02-25', 'X'),
('JJ4U75QD','Joshua','Collins','155 Flores Drive, Cynthiashire, NT, 2920','1944-03-26', 'X'),
('VY1W317P','Karina','Brown','Unit 85 377 Adams Strand, Lake Melissaport, WA, 2673','1997-05-01', 'X'),
('J0U6LEUM','David','Vincent','27 Short Tarn, Kruegerville, WA, 2897','1964-11-25', 'M'),
('26672894','Kathleen','Johnson','2 Moss Foreshore, Jamesborough, NT, 2977','1949-01-08', 'X'),
('V0S7YMWZ','Glenn','Palmer','4 Michelle Trailer, Sandovalbury, WA, 2982','1967-01-19', 'X'),
('25791672','Erica','Dawson','19 Rodney Round, Jacobsfort, SA, 2600','1954-05-23', 'F'),
('VU4USMJ4','Kevin','Dillon','989/85 Stout Dale, New Ryan, TAS, 2920','2005-09-14', 'M'),
('24822337','Brian','Gonzalez','603/8 Maddox Laneway, Port Jamie, NSW, 2773','1966-07-06', 'X'),
('JXG56XIY','William','Williams','Level 5 9 Megan Siding, New Erik, WA, 2631','1991-02-16', 'M'),
('29877806','Jose','Harrington','8/0 Davidson Subway, Alvarezfort, VIC, 4580','1994-12-17', 'X'),
('VVYVZR9K','Ryan','Ortega','Suite 757 4 Patterson Extension, Wilsonmouth, WA, 2978','1972-09-16', 'X'),
('V6UOMAUX','Angela','Martinez','8/390 Joseph Quadrangle, Reginaburgh, ACT, 2786','1956-06-10', 'X'),
('J5N9V9V2','Amanda','Brown','616/06 Mccullough Common, South Donaldchester, ACT, 2984','1953-01-06', 'X'),
('23945626','Kimberly','Baker','93 Johnson Loop, Andrewmouth, VIC, 2668','1953-01-22', 'X'),
('28481977','Nicole','Taylor','Flat 96 8 George Wynd, Richardmouth, WA, 2942','1961-03-19', 'F'),
('VUUACKDV','Kathryn','Galvan','18 Dickson Motorway, Rossville, TAS, 2993','1963-05-19', 'X'),
('20281869','Stacy','Hansen','07/028 Clark Pocket, East Robertfort, ACT, 2513','1959-05-21', 'X'),
('20810027','Ryan','Chan','1 Gary Cutting, Lake Brandonstad, NSW, 2615','1978-03-21', 'M'),
('20783481','Angela','Graham','Suite 780 4 Martha Little, Port Kennethside, TAS, 2774','1945-03-03', 'X'),
('29932564','Cynthia','Craig','Suite 861 47 Mack Cove, Port Michelle, NT, 2469','1955-02-05', 'F'),
('JC62TGO9','Yolanda','Berry','3 Elizabeth Vale, New Alexis, SA, 2624','1978-05-07', 'X'),
('JWBV39C4','Laura','Johnson','4/249 Boyd Crossway, Mitchellmouth, TAS, 2929','1956-09-05', 'X'),
('JCWO1D3W','Sarah','Cameron','17/13 Norma Lower, Davidport, NT, 2910','1970-08-23', 'X'),
('24158201','Ana','Prince','3 Ferguson Walk, Batesfort, TAS, 2444','1968-12-17', 'F'),
('VC11F31N','Bonnie','Schneider','898 Lewis Port, East Deborah, WA, 2830','1964-03-25', 'X'),
('JATAAJ9K','Tyler','Kemp','023/724 Fletcher Close, Cherylhaven, WA, 2651','1975-07-28', 'X'),
('21851587','Michael','Mitchell','402 Morrow Bridge, Kimberlyhaven, VIC, 2965','1999-02-05', 'M')
;

INSERT INTO classes
  (`name`, `code`)
VALUES
	('Version Control and Object Oriented', 'RIoT'),
	('Introduction to Programming in Python', 'ICTPRG302'),
	('Data Driven Applications', 'DDA'),
	('Web Developement Essentials', 'ICTWEB450');

INSERT INTO enrolments
	(student_id, class_id)
VALUES
(1, 1),
(10, 3),
(11, 1),
(12, 3),
(13, 3),
(14, 3),
(15, 1),
(16, 2),
(17, 3),
(18, 1),
(19, 2),
(2, 2),
(20, 1),
(21, 2),
(22, 2),
(23, 3),
(24, 2),
(25, 3),
(26, 3),
(27, 2),
(28, 1),
(29, 3),
(3, 2),
(30, 3),
(31, 1),
(32, 1),
(33, 1),
(34, 3),
(35, 1),
(36, 3),
(37, 2),
(38, 3),
(39, 1),
(4, 1),
(40, 2),
(41, 1),
(42, 2),
(43, 1),
(44, 3),
(45, 1),
(46, 3),
(47, 2),
(48, 3),
(49, 2),
(5, 1),
(50, 2),
(51, 1),
(52, 3),
(53, 2),
(54, 1),
(55, 3),
(56, 2),
(57, 2),
(58, 2),
(59, 2),
(6, 1),
(60, 2),
(7, 3),
(8, 1),
(9, 3);

