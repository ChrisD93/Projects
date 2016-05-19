--setting up the perfect pizza database
--dropping the database so we can start with a clean slate
--script courtesy of Claude Powers
use master
go
drop database pizza;
go
--Now we can create the pizza database
create database pizza;
go
--loading the database
use pizza;
go
CREATE TABLE Customer
(
	CustomerPhoneKey CHAR(11),
	CustomerLastName CHAR(15) NOT NULL,
	CustomerAddress1 CHAR(25) NULL,
	CustomerAddress2 CHAR(25) NULL,
	CustomerCity CHAR (15) NULL,
	CustomerState CHAR(2) NULL,
	CustomerZip CHAR(5) NULL,
	ReferredBy CHAR(11) default '0000000000',
	constraint custPhone_pk primary key (CustomerPhoneKey),
	constraint custRefBy foreign key(referredBy) references customer(customerphonekey)
	)

CREATE TABLE Employee
(
	EmployeeKey CHAR(10),
	EmployeeLastName CHAR(15) NOT NULL,
	EmployeeFirstName CHAR(15) NULL,
	EmployeeHireDate DATE NOT NULL,
	constraint EmpEmpKey_pk primary key (EmployeeKey))

CREATE TABLE Product
(
	ProductKey CHAR(10),
	ProductName CHAR(20),
	ProductUnitSize CHAR(15),
	ProductUnitPrice decimal(6,2),
	constraint ProdProdKey_pk primary key (ProductKey))

CREATE TABLE CustomerOrder
(
	OrderKey CHAR(10),
	OrderDate DATE,
	OrderTime TIME,
	CustomerPhoneKey CHAR(11),
	EmployeeKey CHAR(10),
	constraint OrderKey_pk primary key (OrderKey),
	constraint OrderCustPh_fk FOREIGN KEY (CustomerPhoneKey) rEFERENCES Customer(CustomerPhoneKey),
	constraint OrderEmpKey_fk FOREIGN KEY (EmployeeKey) rEFERENCES Employee(EmployeeKey))

CREATE TABLE OrderDetail
(
	OrderDetailKey CHAR(10),
	OrderKey CHAR(10),
	ProductKey CHAR(10),
	OrderDetailQuantity INT,
	OrderDetailPriceCharged decimal(6,2),
	constraint OrderDetKey_pk primary key (OrderDetailKey),
	constraint OrderDetOrdKey_fk FOREIGN KEY (OrderKey) REFERENCES CustomerOrder(OrderKey),
	constraint orderDetProdKey_fk FOREIGN KEY (ProductKey) REFERENCES Product(ProductKey))
go
--inserting the data
INSERT INTO Customer(CustomerPhoneKey, CustomerLastName, CustomerAddress2,
CustomerAddress1, CustomerCity, CustomerState, CustomerZip, ReferredBy)
VALUES
('0000000000', 'No Referral',null, null, null, null, null, null),
('2065552123','Lamont',NULL,'161 South Western Ave.', NULL, NULL, '98001', '0000000000'),
('2065553252','johnston','Apt. 304', '1215 Terrace Avenue', 'Seattle', 'WA', '98001', '2065552123'),
('2065552963','Lewis',NULL, '520 East lake Way', NULL, NULL, '98002', '0000000000'),
('2065553213','Anderson','Apt 10','222 Southern Street',NULL, NULL, '98001','2065553252' ),
('2065552217', 'Wong',NULL,'2832 Washington Ave.','Seattle','WA','98002', '0000000000'),
('2065556623','Jimenenz','Apt 13 B', '1200 Norton Way',Null, NULL, '98003', '2065552123')

INSERT INTO Employee(EmployeeKey,EmployeeLastName,EmployeeFirstName,EmployeeHireDate)
VALUES('cmanning','Manning', 'Carol', '3/12/2013'),
('btaylor','Taylor','Bob','4/16/2013'),
('skristoph','Kristopherson','Stephen','6/2/2013')

INSERT INTO Product(ProductKey,ProductName,ProductUnitSize, ProductUnitPrice)
VALUES('Soda','Soda bottle','2 liter bottle',3.75),
('brdstks', 'Breadsticks','8 per pack',2.5),
('basicS', 'Basic Pizza Small', '8 inch', 5.35),
('basicM', 'Basic Pizza Medium', '12 inch', 7.35),
('basicL', 'Basic Pizza Large','18 inch',13.5),
('specialS','Specialty small', ' 8 inch',6.35),
('specialM', 'Specialty medium','12 inch',9.25),
('specialL','Specialty large','18 inch',15),
('top','Additional Topping', '1 cup', 1) 

INSERT INTO CustomerOrder(OrderKey,OrderDate,OrderTime,CustomerPhoneKey,EmployeeKey)
VALUES('1000','2013-10-8','2:15 PM', '2065552963', 'cmanning'),
('1001','2013-10-8','2:21 PM', '2065556623', 'cmanning'),
('1002','2013-10-8','2:30 PM', '2065552963', 'cmanning'),
('1003','2013-10-8','3:15 PM', '2065552123', 'skristoph'),
('1004','2013-10-10','11:15 PM', '2065552217', 'btaylor'),
('1005','2013-10-10','12:02 PM', '2065556623', 'btaylor')

INSERT INTO OrderDetail( OrderDetailKey,OrderKey,ProductKey,OrderDetailQuantity,OrderDetailPriceCharged)
VALUES('1', '1000', 'Soda', 2, 7.25),
('2', '1000', 'brdstks', 1, 2.5),
('3', '1000', 'SpecialM', 1, 7.35),
('4', '1001', 'specialL', 1, 15),
('5', '1002', 'Soda', 2, 7.25),
('6', '1002', 'basicM', 3, 20),
('7', '1003', 'basicM', 1, 7.35),
('8', '1003', 'top', 4, 4),
('9', '1004', 'basicL', 1, 13.5),
('10', '1005', 'basicM', 2, 14.7)

-- New Data Updates provided by Claude Powers on 4/11/2013 -- 

-- 20 new customers for the Perfect Pizza Schema --
INSERT INTO Customer(CustomerPhoneKey, CustomerLastName, CustomerAddress2,
CustomerAddress1, CustomerCity, CustomerState, CustomerZip, ReferredBy)
VALUES
('2064748292','Telford','Apt. 263','8692 Velvet Manor','Eastgate','WA','98007', '0000000000'),
('2068762341','Schaner','Apt. 122','5389 Broad Beacon','Bellevue','WA','98005', '0000000000'),
('2063211234','Myres','Apt. 785','6930 Foggy Parade','Eastgate','WA','98007', '2065552963'),
('2064854857','Verret','Apt. 16 E','6960 Tawny Branch Grove','Medina','WA','98004', '2065553213'),
('2063942736','Doepke','Apt. 081','8528 Shady Elk Point','Seattle','WA','98001', '2065552123'),
('2062938475','Spero','Apt. 22','6994 Quaking Diversion,','Medina','WA','98004', '0000000000'),
('2062633733','Demuth','Apt. 311','1270 Umber Bay','Bellevue','WA','98005','2064748292'),
('2062538594','Kuhlmann','Apt. 604','4260 Pleasant End','Seattle','WA','98002', '0000000000'),
('2063948571','Mayhue','Apt. 101','9368 Middle Harbour','Kirkland','WA','98006', '2062633733'),
('2063948563','Balk','Apt. 247','4506 Bright Autumn Drive','Kirkland','WA','98006', '2062938475'),
('2062687960','Booe',NULL,'9350 Rustic Zephyr Ave.','Medina','WA','98004', '0000000000'),
('2067569135','Das',NULL,'Green Medow  Boulevard','Bellevue','WA','98005','2062552345'),
('2069092383','Furtado',NULL,'547 Dusty Heights','Eastgate','WA','98007', '0000000000'),
('2067071346','Reinoso',NULL,'6445 Cozy Nook','Eastgate','WA','98007', '0000000000'),
('2062552345','Morphis',NULL,'8826 Red Island Villas','Bellevue','WA','98005', '0000000000'),
('2061346344','Quinto',NULL,'546 Fallen Lake Wharf','Seattle','WA','98003','2062552345'),
('2063281946','Brewton',NULL,'7949 Rocky Park','Seattle','WA','98001', '2062633733'),
('2066437181','Mccullen',NULL,'1377 Grand Cider Street','Kirkland','WA','98006','2062938475'),
('2061034733','Nickens',NULL,'1092 Jagged Mount Court','Kirkland','WA','98006', '2062938475'),
('2064339614','Shumpert',NULL,'7648 Pioneer Drive','Medina','WA','98004', '2063942736')

-- 11 new products for the Perfect Pizza Schema --
INSERT INTO Product(ProductKey,ProductName,ProductUnitSize, ProductUnitPrice)
VALUES
('squareS','Small Square Pizza','8 inch', 5.99),
('squareM','Medium Square Pizza','12 inch', 7.99),
('squareL','Large Square Pizza','18 inch', 13.99),
('squareXL','XL Square Pizza','24 inch', 16.99),
('cesarSmall','SmallCesar Salad','small', 3.25),
('cesarLarge','Large Cesar Salad','large', 6.55),
('greekSmall','Small Greek Salad','small', 3.50),
('greekLarge','Large Greek Salad','large', 6.80),
('buffWings','Buffalo Wings','10 per pack', 8.99),
('bbqWings','BBQ Wings','10 per pack', 9.99),
('bhWings','Boneless Hot Wings','10 per pack', 11.99)



-- 10 new employees for the Perfect Pizza Schema --
INSERT INTO Employee(EmployeeKey,EmployeeLastName,EmployeeFirstName,EmployeeHireDate)
VALUES
('clanglais','Langlais','Collin','6/13/2009'),
('jballa','Balla','Joe','7/16/2009'),
('esteere','Steere','Eladia',' 10/8/2009'),
('ccooke','Cooke','Cathleen',' 2/16/2010'),
('gvalla','Valla','Guillermina','7/8/2010'),
('emotter','Motter','Emanuel','9/24/2011'),
('eroeder','Roeder','Eda','12/4/2012'),
('lhowe','Howe','Luigi','12/10/2012'),
('pnewson','Newson','Patrica','8/23/2013'),
('beatmon','Eatmon','Buster','9/17/2014')



-- 20 new orders for the Perfect Pizza Schema --
INSERT INTO CustomerOrder(OrderKey,OrderDate,OrderTime,CustomerPhoneKey,EmployeeKey)
VALUES
('1006','2013-8-3','1:30 PM', '2064748292', 'clanglais'),
('1007','2013-9-2','2:00 PM', '2068762341', 'jballa'),
('1008','2013-9-10','3:15 PM', '2064748292', 'esteere'),
('1009','2013-9-15','3:05 PM', '2063942736', 'ccooke'),
('1010','2013-9-29','4:30 PM', '2063948571', 'gvalla'),
('1011','2013-7-7','4:00 PM', '2069092383', 'emotter'),
('1012','2013-7-9','5:45 PM', '2061034733', 'eroeder'),
('1013','2013-7-11','5:23 PM', '2069092383', 'lhowe'),
('1014','2013-7-13','5:14 PM', '2062633733', 'pnewson'),
('1015','2013-7-16','2:09 PM', '2067569135', 'beatmon'),
('1016','2013-6-7','1:37 PM', '2067071346', 'clanglais'),
('1017','2013-6-13','12:59 PM', '2067071346', 'jballa'),
('1018','2013-6-20','2:42 PM', '2062538594', 'esteere'),
('1019','2013-6-19','8:09 PM', '2063948563', 'ccooke'),
('1020','2013-6-16','8:16 PM', '2062687960', 'gvalla'),
('1021','2013-4-10','9:30 PM', '2062552345', 'emotter'),
('1022','2013-4-15','9:55 PM', '2064339614', 'eroeder'),
('1023','2013-3-1','10:08 PM', '2063211234', 'lhowe'),
('1024','2013-1-2','7:45 PM', '2064854857', 'pnewson'),
('1025','2013-2-20','6:45 PM', '2062938475', 'beatmon'),
('1026','2013-2-21','11:45 AM', '2062633733', 'clanglais')



-- 51 new order details for the Perfect Pizza Schema -- 
INSERT INTO OrderDetail( OrderDetailKey,OrderKey,ProductKey,OrderDetailQuantity,OrderDetailPriceCharged)
VALUES
('11', '1006','squareM', 3, 23.97),
('12', '1006', 'top', 3, 3),
('13', '1006', 'brdstks', 2, 5),
('14', '1006', 'Soda', 2, 7.25),
('15', '1007', 'greekSmall',1, 3.50),
('16', '1007', 'brdstks', 1, 2.5),
('17', '1008', 'squareXL',2, 33.98),
('18', '1008', 'Soda', 2, 7.25),
('19', '1009', 'squareL',1, 13.99),
('20', '1009', 'basicL', 2, 17),
('21', '1010', 'top', 2, 2),
('22', '1010', 'specialL', 1, 15),
('23', '1011', 'buffWings', 1, 8.99),
('24', '1011', 'bhWings',1, 11.99),
('25', '1011', 'Soda', 1, 3.75),
('26', '1012', 'basicM', 2, 14.7),
('27', '1012', 'top', 3, 3),
('28', '1012', 'Soda', 1, 3.75),
('29', '1013', 'greekLarge', 2, 13.6),
('30', '1013', 'bbqWings', 2, 19.98),
('31', '1014', 'squareXL', 1, 16.99),
('32', '1014', 'top', 5, 5),
('33', '1014', 'brdstks', 3, 7.5),
('34', '1015', 'specialL', 1, 15),
('35', '1015', 'cesarSmall', 2, 6.5),
('36', '1016', 'squareM', 2, 15.98),
('37', '1016', 'top', 6, 6),
('38', '1016', 'brdstks', 2, 5),
('39', '1017', 'cesarLarge', 1, 6.55),
('40', '1017', 'brdstks', 1, 2.50),
('41', '1018', 'buffWings', 2, 17.98),
('42', '1018', 'squareXL', 2, 33.98),
('43', '1018', 'Soda', 2, 7.50),
('44', '1019', 'basicS', 3, 16.05),
('45', '1019', 'cesarSmall', 3, 10.50),
('46', '1020', 'specialL', 1, 15),
('47', '1020', 'Soda', 1, 3.75),
('48', '1021', 'squareL', 2, 27.98),
('49', '1021', 'top', 5, 5),
('50', '1021', 'greekLarge', 1, 6.80),
('51', '1022', 'basicL', 1, 13.50),
('52', '1022', 'cesarLarge', 1, 6.55),
('53', '1023', 'basicS', 1, 5.35),
('54', '1024', 'buffWings', 2, 17.98),
('55', '1024', 'bbqWings', 2, 19.98),
('56', '1024', 'bhWings', 2, 23.98),
('57', '1024', 'brdstks', 4, 10),
('58', '1024', 'Soda', 4, 15),
('59', '1025', 'bhWings', 1, 11.99),
('60', '1025', 'Soda', 2, 7.50),
('61', '1026', 'cesarLarge', 1, 6.55),
('62', '1026', 'greekLarge', 1, 6.80)
