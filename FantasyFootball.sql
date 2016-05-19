--dropping all tables that may exist in Master
--if you do not have these tables in Master you will see a lot of 
--red error messages.  DON'T PANIC.  THIS IS OK!
drop table game;
drop table roster;
drop table team_coach;
drop table parent_player;
drop table team;
drop table location;
drop table coach;
drop table player;
drop table playerrec;
drop table referee;
drop table person;

--drop the football database so that it can be recreated
--If you do not have a football database, you will see red error messages.
--DON'T PANIC.  THIS IS OK!  
drop database football
go

--recreate the football database
create database football
go
use football
--Dropping all prior versions of the existing tables
--You will see red error messages at first if these items do not exist.
--DON'T PANIC.  THIS IS OK!
drop table game;
drop table roster;
drop table team_coach;
drop table parent_player;
drop table team;
drop table location;
drop table coach;
drop table player;
drop table playerrec;
drop table referee;
drop table person;

--Once this script finishes running you should see:
--(61 row(s) affected)

--(3 row(s) affected)

--(4 row(s) affected)

--(7 row(s) affected)

--(12 row(s) affected)

--(33 row(s) affected)

--(26 row(s) affected)

--(12 row(s) affected)

--(13 row(s) affected)

--(3 row(s) affected)

--(3 row(s) affected)

--(28 row(s) affected)

--(28 row(s) affected)

--this means everything installed correctly

--Creating the PERSON table
create table person(
PersonId 		integer ,
last_name 		CHAR(25)	NOT NULL,
first_name 		CHAR(15),
address 		CHAR(25),
city 			CHAR(30),
state 			CHAR(2)		default 'MI' NOT NULL,
Zip 			CHAR(10),
phone 			CHAR(15),
--constraints
constraint person_id_pk Primary key(PersonID)
);
--populating PERSON table
INSERT INTO person
  (PersonID, last_name, first_name, address, city, zip, phone)
 VALUES
 --Coaches
  (91, 'Dillinger', 'Alfred', '21658 Westchester', 'Roseville', '48752', '586-478-9856'),
  (92,'Velasquez','Carlos','283 King Street','Clinton Twp.', '48150','586-999-6666'),
  (93,'Ngao','Larry','5 Modrany','Clinton Twp.', '48150','586-355-8882'),
  (94,'Nagayama','Midori','68 Via Centrale','Clinton Twp.', '48150','586-852-5764'),
  (95,'Quigley','Mark','6921 King Way','Macomb', '48138','586-559-7777'),
  (96,'Ropeburn','Audrey','86 Chu Street','Macomb', '48138','586-559-8764'),
  (110,'Sam','Martin','34 Maiden Lane','Warren','48157','586-555-9867'),
  (111,'Timothy','Allen','210 West 101st','Westland','48056','586-555-7654'),
  (112,'Turner','Theodore','254 Bleeker','Clinton Twp.','48153','586-555-9876'),
  (113,'Barney','James','518 West 120th','Clinton Twp.','48151','586-555-3872'),
  (114,'Tanner','Warren','56 10th Avenue','Warren','48657','586-555-1873'),
  (115,'Ford','Tim','415 West 101st','Sterling Heights','48057','586-555-9837'),
  (116,'Scott','Bob','100 East 87th','Warren','48765','586-555-1298'),
 --Parents
  (97,'Urguhart','Molly','3035 Laurier Blvd.','Macomb', '48138','586-542-9988'),
  (98,'Menchu','Roberta','Boulevard de Waterloo 41','Macomb', '48138','586-504-2228'),
  (99,'Biri','Ben','398 High St.','Sterling Heights', '48123','586-455-9863'),
  (100,'Catchpole','Antoinette','88 Alfred St.','Sterling Heights', '48123','586-399-1411'),
  (101,'Lefbowitz','Michael','1438 E 100th St','Warren', '48257', '586-555-9847'),
  (102,'Axch','Mary','144-70 41st Ave. #4T', 'Warren', '11355', '586-555-4763'),
  (103,'Cook','Angel','320 John St', 'Warren', '07029', '586-555-3893'),
  (104,'Griffen','Arun','Box 86', 'Warren', '11368', '586-555-8329'),
  (105,'Lancer', 'Jack', '48795 Champagne', 'Macomb', '48795', '586-698-4258'),
  (106,'Kingston','John','100 East 87th','Warren','48765','586-555-1298'),
  (107,'Blake', 'Judy', '518 West 120th','Macomb','48759','586-555-3987'),
  (108,'Clark', 'Melissa','210 West 101st','Sterling Heights','48759','586-555-9865'),
  (109,'Jones', 'Patricia','34 Sixth Ave','Clinton Twp.','48150','586-555-9876'), 
  (146,'Griffen','Jackie','Box 86', 'Warren', '11368', '586-555-8329'),
  (147,'Lancer', 'Jennifer', '48795 Champagne', 'Macomb', '48795', '586-698-4258'),
  (148,'Kingston','Barb','100 East 87th','Warren','48765','586-555-1298'),
  (149,'Blake', 'Art', '518 West 120th','Macomb','48759','586-555-3987'),
  (150,'Clark', 'Mark','210 West 101st','Sterling Heights','48759','586-555-9865'),
  (151,'Jones', 'Sam','34 Sixth Ave','Clinton Twp.','48150','586-555-9876'),
  (152,'Gregory', 'Jeff', '478 E. Russel', 'Sterling Heights', '48204', '586-478-1245'), 
 --Players 
  (117,'Ropeburn','Jacob','86 Chu Street','Macomb', '48138','586-559-8764'),
  (118,'Urguhart','Matt','3035 Laurier Blvd.','Macomb', '48138','586-542-9988'),
  (119,'Menchu','Raymond','Boulevard de Waterloo 41','Macomb', '48138','586-504-2228'),
  (120,'Biri','Ben','398 High St.','Sterling Heights', '48123','586-455-9863'),
  (121,'Catchpole','Anthoney','88 Alfred St.','Sterling Heights', '48123','586-399-1411'),
  (122,'Lefbowitz','Michael','1438 E 100th St', 'Warren', '48257', '586-555-9847'),
  (123,'Axch','Ben','144-70 41st Ave. #4T', 'Warren', '11355', '586-555-4763'),
  (124,'Cook','Jason','320 John St', 'Warren', '07029', '586-555-3893'),
  (125,'Griffen','Thomas','Box 86', 'Warren', '11368', '586-555-8329'),
  (126,'Lancer', 'Jack', '48795 Champagne', 'Macomb', '48795', '586-698-4258'),
  (127,'Kingston','Jason','100 East 87th','Warren','48765','586-555-1298'),
  (128,'Blake', 'Jacob', '518 West 120th','Macomb','48759','586-555-3987'),
  (129,'Clark', 'Martin','210 West 101st','Sterling Heights','48759','586-555-9865'),
  (130,'Jones', 'Paul','34 Sixth Ave','Clinton Twp.','48150','586-555-9876'),    
  (131,'Urguhart','Joseph','3035 Laurier Blvd.','Macomb', '48138','586-542-9988'),
  (132,'Menchu','John','Boulevard de Waterloo 41','Macomb', '48138','586-504-2228'),
  (133,'Biri','Christopher','398 High St.','Sterling Heights', '48123','586-455-9863'),
  (134,'Catchpole','Doug','88 Alfred St.','Sterling Heights', '48123','586-399-1411'),
  (135,'Lefbowitz','David','1438 E 100th St','Warren', '48257', '586-555-9847'),
  (136,'Axch','Chad','144-70 41st Ave. #4T', 'Warren', '11355', '586-555-4763'),
  (137,'Cook','Chase','320 John St', 'Warren', '07029', '586-555-3893'),
  (138,'Griffen','William','Box 86', 'Warren', '11368', '586-555-8329'),
  (139,'Urguhart','Barry','3035 Laurier Blvd.','Macomb', '48138','586-542-9988'),
  (140,'Menchu','Frank','Boulevard de Waterloo 41','Macomb', '48138','586-504-2228'),
  (141,'Biri','George','398 High St.','Sterling Heights', '48123','586-455-9863'),
  (142,'Catchpole','Harrison','88 Alfred St.','Sterling Heights', '48123','586-399-1411'),
  (143,'Gregory','Jacob', '478 E. Russel', 'Sterling Heights', '48204', '586-478-1245'),
  (145,'Gregory', 'Jeff', '478 E. Russel', 'Sterling Heights', '48204', '586-478-1245')
;

--inserting refs 
INSERT INTO person
  (PersonID, first_name, last_name, address, city, zip)
 VALUES
  (160, 'Tom', 'Jones', '2016 Oak', 'Macomb', '48751'),
  (161, 'Jim', 'Johnson', '4781 Elm', 'Roseville', '48712'),
  (162, 'Steve', 'Clark', '114 Birch', 'Clinton Twp.', '48734')
;

--Creating the LOCATION table
CREATE TABLE location (
locationID		integer,
locationName	char(20)	not null,
address			char(20)	not null,
city			char(30)	not null,
state			char(2)		default 'MI',
zip				char(5)		not null,
phone			char(15)	not null,
--constraints
constraint locationID_pk primary key(locationID)
);
--inserting data into location table
INSERT INTO location 
     (locationID, locationName, address, city, zip, phone)
    VALUES
     (1, 'Field A', '38765 Plymouth Rd.','Warren','48156','586-555-2987'),
     (2,'Field B', '8765 Farmington Rd.','Clinton Twp.', '48150','586-555-9876'),
     (3,'Field C', '64738 Ford Rd.','Macomb', '48125','586-555-9847'),
     (4,'Field D', '9876 Haggerty','Sterling Heights','48158','586-555-2367')
;

--creating team table
CREATE TABLE team(
teamID			integer,
teamName		char(15)
--constraints
CONSTRAINT teamID_pk primary key(teamID)
);

--populating the TEAM table
INSERT INTO team
	(teamID,teamName)
	VALUES
	(101, 'Purple Pilots'),
	(102, 'Red Devils'),
	(103, 'Silver Lions'),
	(104, 'Blue Jackets'),
	(105, 'Green Hornets'),
	(106, 'Gold Dragons'),
	(100, 'No Winner'),
	(107, 'Red Tigers')
;

--creating game table
CREATE TABLE game(
gameID		    integer,
gameDate		DATE,  
gameTime		TIME,
home_team		integer		not null,
visitor_team	integer		not null, 
winning_team	integer		not null default 100, 
refID			integer		not null,
locationID		integer		not null, 
score			char(10),
--constraints
constraint gameID_pk primary key(gameID),
CONSTRAINT hometeam_fk foreign key(home_team) REFERENCES team(teamID),
constraint visitorteam_fk foreign key(visitor_team) references team(teamID),
CoNSTRAINT winningteam_fk foreign key(winning_team) REFERENCES team(teamID),
CONSTRAINT refID_fk foreign key(refID) REFERENCES person(personID),
CONSTRAINT locationID_fk foreign key(locationID) references location(locationID)
);

--inserting data into GAME table
INSERT INTO game
     (gameID, gameDate, gameTime, home_team, visitor_team, winning_team, refID, locationID, score)
    VALUES
     (10012, '8/23/2012', '6:00 PM', 101, 105, 105, 160, 2, '21 - 10'), 
     (10013, '8/23/2012', '6:00 PM', 102, 106, 102, 161, 1, '14 - 0'),
     (10014, '8/23/2012', '6:00 PM', 104 ,103, 104, 162, 3, '24 - 3'),
     (10015, '8/30/2012', '6:00 PM', 105, 102, 105, 161, 1, '17 - 14'),
     (10000, '8/30/2012', '6:00 PM', 106, 104, 106, 162, 2, '14 - 3'), 
     (10001, '8/30/2012', '6:00 PM', 103, 101, 103, 161, 3, '10 - 7'), 
     (10002, '9/6/2012', '6:00 PM', 102, 106, 102, 162, 2, '27 - 14'),
     (10003, '9/6/2012', '6:00 PM', 104, 103, 104, 161, 3, '14 - 7'),
     (10004, '9/6/2012', '6:00 PM', 101, 105, 101, 160, 1, '27 - 7'), 
     (10005, '9/13/2012', '6:00 PM', 106, 104, 106, 162, 1, '14 - 7'), 
     (10006, '9/13/2012', '6:00 PM', 103, 101, 103, 160, 2, '21 - 7'),
     (10007, '9/13/2012', '6:00 PM', 105, 102, 105, 161, 3, '21 - 20')
;

--Creating the Parent_Player table
CREATE TABLE parent_player (
parentID	int,
playerID	int
--constraints
constraint par_playID_pk primary key(parentID, playerID),
constraint parentID_fk foreign key(parentID) references person(personID),
constraint playerID_fk foreign key(playerID) references person(personID)
);

--inserting data into parent_player
INSERT INTO parent_player
  (parentID, playerID)
  VALUES
  (96, 117),
  (97, 118),
  (98, 119),
  (99, 120),
  (100, 121),
  (101, 122),
  (102, 123),
  (103, 124),
  (104, 125),
  (105, 126),
  (106, 127),
  (107, 128),
  (108, 129),
  (109, 130),
  (97, 131),
  (98, 132),
  (99, 133),
  (100, 134),
  (101, 135),
  (102, 136),
  (103, 137),
  (104, 138),
  (97, 139),
  (98, 140),
  (99, 141),
  (100, 142),
  (146, 125),
  (146, 138),
  (147, 126),
  (148, 127),
  (149, 128),
  (150, 129),
  (151, 130)
;

--Create the roster table
CREATE TABLE roster(
playerID	int,
teamID		int
--constraints
constraint player_team_pk  primary key (playerID, teamID),
constraint playerIDroster_fk foreign key(playerID) references person(personID),
constraint teamIDroster_fk foreign key(teamID) references team(teamID)
);

--inserting data into roster table
INSERT INTO roster
  (playerID, teamID)
  VALUES
  (117, 101),
  (118, 101),
  (119, 101),
  (120, 101),
  (121, 101),
  (122, 102),
  (123, 102),
  (124, 102),
  (125, 102),
  (126, 103),
  (127, 103),
  (128, 103),
  (129, 103),
  (130, 103),
  (131, 104),
  (132, 104),
  (133, 104),
  (134, 104),
  (135, 105),
  (136, 105),
  (137, 105),
  (138, 105),
  (139, 106),
  (140, 106),
  (141, 106),
  (142, 106)
;

--Creating the team_coach table
CREATE TABLE team_coach(
coachID		int,
teamID		int
--constraints
constraint coach_teamID_pk primary key(coachID, teamID),
constraint coachID_fk foreign key(coachID) references person(personID),
constraint teamID_fk foreign key(teamID) references team(teamID)
);

--inserting data into the team_coach table
INSERT INTO team_coach
   (coachID, teamID)
   VALUES
  (91, 101),
  (92, 101),
  (93, 102),
  (94, 102),
  (95, 103),
  (96, 103),
  (110, 104),
  (111, 104),
  (112, 105),
  (113, 105),
  (114, 106),
  (115, 106)
;

--Creating the Coach table
Create table coach(
PersonID	int,
StartDate	date not null,
EndDate		date,
BackCheck	char(1) not null default 'N',
OrientMtg	char(1) not null default 'Y',
PrevExp		char(50)
--constraints
constraint coach_personid_pk primary key(PersonID),
constraint coach_personid_fk foreign key(PersonID) references person(personID)
);

--inserting into Coach
insert into coach
	(PersonID, StartDate, BackCheck, OrientMtg)
  values
  (91, '2012-05-09', 'Y', 'Y'),
  (92,'2012-05-09', 'N', 'Y'),
  (93,'2012-05-09', 'N', 'N'),
  (94,'2012-05-15', 'Y', 'Y'),
  (95,'2012-05-15', 'Y', 'N'),
  (96,'2012-06-01', 'Y', 'Y'),
  (110,'2012-06-01', 'Y','Y'),
  (111,'2012-06-10', 'N', 'Y'),
  (112,'2012-06-08', 'Y', 'Y'),
  (113,'2012-06-23', 'Y', 'Y'),
  (114,'2012-06-23', 'Y', 'N'),
  (115,'2012-06-30', 'N','Y'),
  (116,'2012-06-30', 'Y', 'Y')
;
insert into coach
	(PersonID, StartDate, EndDate, BackCheck, OrientMtg)
  values
  (160,'2011-05-01', '2012-08-23', 'Y', 'Y'),
  (161,'2011-04-21', '2012-08-23', 'Y', 'Y'),
  (162,'2011-03-28', '2012-08-23', 'Y', 'Y')
;
  
--Create the referee table
create table referee(
PersonID	int,
StartDate	date	not null,
EndDate		date
--constraints
constraint refereePersonID_pk primary key(PersonID),
constraint refereePersonID_fk foreign key(PersonID) references Person(PersonID)
);

--insert data into referee
insert into referee
	(PersonID, StartDate)
  values
  (160,'2012-08-23'),
  (161,'2012-08-23'),
  (162,'2012-08-23')
;  
--create the players table
create table player(
PersonID	int,
StartDate	date	not null,
EndDate		date,
HealthCon	Char(100) not null default 'none',
PrevExp		char(50)  not null default 'none',
--constraints
constraint playerPersonID_pk primary key(PersonID),
constraint playerPersonID_fk foreign key(PersonID) references Person(PersonID)
);

--insert data into Player
insert into player
	(PersonID, StartDate, HealthCon,PrevExp)
  values
  (117,'2012-05-07', 'none', 'St. Clair Shores League'),
  (118,'2012-06-15', 'none', 'Roseville League'),
  (119,'2012-05-28','none', 'none'),
  (120,'2012-06-12','none', 'none'),
  (121,'2012-07-14','none', 'none'),
  (122,'2012-05-07', 'none','St. Clair Shores League'),
  (123,'2012-07-14', 'none','none'),
  (124,'2012-06-12','allergic to Penicillin','Fraser league'),
  (125,'2012-05-28','none', 'none'),
  (126,'2012-07-14','none', 'none'),
  (127,'2012-06-12','allergic to peanuts','Fraser league'),
  (128,'2012-05-28','none', 'none'),
  (129,'2012-06-15', 'prior broken left leg','Fraser league'),
  (130,'2012-07-14','none', 'none'),    
  (131,'2012-06-12', 'prior broken right arm','Fraser league'),
  (132,'2012-05-07','none', 'none'),
  (133,'2012-07-14','none', 'none'),
  (134,'2012-05-28','none', 'St. Clair Shores League'),
  (135,'2012-06-15','none', 'Roseville League'),
  (136,'2012-06-12', 'allergic to tree nuts', 'none'),
  (137,'2012-05-28','none', 'Roseville League'),
  (138,'2012-05-07', 'prior sprained ankle', 'none'),
  (139,'2012-05-28', 'allergic to peanuts', 'none'),
  (140,'2012-06-15', 'none','St. Clair Shores League'),
  (141,'2012-05-28', 'allergic to peanuts', 'none'),
  (142,'2012-05-07', 'none','St. Clair Shores League'),
  (143,'2012-08-01', 'none','none'),
  (145,'2012-08-01', 'none', 'none')
;
--create the playerrec table
create table playerrec(
PersonID	int,
SeasonID	int,
Fee			decimal(5,2) not null default 0.00,
Physical	char(1) not null default 'N',
--constraints
constraint playerrecPersonID_pk primary key(PersonID, SeasonID),
constraint playerrecPersonID_fk foreign key(PersonID) references Person(PersonID)
);

--inserting data into playerrec
insert into playerrec
	(PersonID, SeasonID,Fee, Physical)
  values
   (117, 101, 0.00, 'Y'),
   (118, 101, 25.00, 'N'),
   (119, 101, 25.00, 'Y'),
   (120, 101, 25.00, 'Y'),
   (121, 101, 25.00, 'Y'),
   (122, 101, 0.00, 'N'),
   (123, 101, 25.00, 'Y'),
   (124, 101, 25.00, 'N'),
   (125, 101, 25.00, 'Y'),
   (126, 101, 25.00, 'N'),
   (127, 101, 25.00, 'Y'),
   (128, 101, 0.00, 'Y'),
   (129, 101, 25.00, 'Y'),
   (130, 101, 25.00, 'Y'),
   (131, 101, 25.00, 'Y'),
   (132, 101, 25.00, 'Y'),
   (133, 101, 25.00, 'N'),
   (134, 101, 0.00, 'Y'),
   (135, 101, 25.00, 'N'),
   (136, 101, 25.00, 'Y'),
   (137, 101, 25.00, 'N'),
   (138, 101, 25.00, 'Y'),
   (139, 101, 0.00, 'N'),
   (140, 101, 25.00, 'N'),
   (141, 101, 25.00, 'Y'),
   (142, 101, 25.00, 'Y'),
   (143, 101, 25.00, 'Y'),
   (145, 101, 0.00, 'N')
;  
  
  
   

 