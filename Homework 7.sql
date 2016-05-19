use auntieB

----Chris Draper
---- ITCS 1170 6pm
---- Homework 7

-- Q1
create table Artist(
	peopleID int	 Not Null,
	taxIDnum char(12) Not Null,
	artistSince	date Not Null
	-- constraints
	constraint artist_peopleID_pk primary key(peopleID),
	constraint artist_taxIDnum_uk unique(taxIDnum)
	);

create table Artist_Item(
	itemID	int	 Not Null,
	dateAquired date Not Null,
	purchasePrice decimal(5,2) Not Null default 0.0
	--constraints
	constraint artist_item_itemID_pk primary key (itemID)
	);

--Q2
alter table people
	add constraint peopleType_people_ck check (peopleType in ('ART', 'EMP', 'CHAR', 'OC'));

--Q3
insert into people
	(peopleID, FirstName,LastName, peopleType)
 values
	('5000', 'Chris', 'Draper', 'ART')

--Q4
insert into item_type
	(itemTypeID, name, description)
	values
	('5000', 'Artwork', 'Hand Crafted Artwork')

--Q5
insert into item
	(itemID, itemTypeID, size, maxPrice, minPrice, ownerID)
	values
	('5000', '5000', '12 inches', '25.00', '15.00', '5000'),
	('5001', '5000', '10 inches', '15.00', '10.00', '5000'),
	('5002', '5000', '8 inches', '10.00', '7.00', '5000')

insert into Artist_Item
	(itemID, dateAquired, purchasePrice)
	values
	('5000', '2014-11-17', '15.00'),
	('5001', '2014-11-24', '10.00'),
	('5002', '2014-11-25', '7.00')

--Q6
alter table charity
	add store char(10) Not Null default 'NO'

update charity
set store = 'YES'
where name in ('Salvation Army', 'Mother Wattles', 'Fresh Start Charity')

--Q7
update people
set phone = 'no phone'
where phone is null;

update people
set cellPhone = 'no phone'
where cellPhone is null;

update people
set email = 'no email'
where email is null;
select *
from people

--Q8
delete 
from order_item
where itemID = '2000'

--Q9
go
create view TotalsByType
([Type Name], [Total Sold])
as
select it.name, sum(oi.price)
from order_item oi join item i
	on oi.itemID = i.itemID
	join item_type it
	on it.itemTypeID = i.itemTypeID
group by it.name
go

select *
from totalsByType
where [Total Sold] >= 100
order by [Total Sold] desc

--Q10
create index people_firstName
	on people(firstName);

create index people_lastName
	on people(lastName);

create index people_phone
	on people(phone);
	


