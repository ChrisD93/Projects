use football
go

select first_name + last_name as [Person Name]
from person
where city  like '%macomb%'
order by last_name

select personid, fee as [Fee Paid]
from playerrec
where fee > 0
order by personid

select first_name, last_name
	 , coalesce (Phone, 'No phone') as Phone
from person
where phone is null

select personid, startdate
, (datepart(year, current_timestamp)  - datepart(year, startdate)) as [Num Years]
from coach
where enddate is null

select gameid, home_team, visitor_team, score
from game
where score like '% - 0%'




