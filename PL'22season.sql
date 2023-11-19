select *
from [PL'22season]

--Clean date

select date,CONVERT (date, date) as convertedate
from [PL'22season]

alter table [PL'22season]
add convertedate date

update [PL'22season]
set convertedate = (date)

--clean time

select time, convert (time, time) as convertedtime
from [PL'22season]

alter table [PL'22season]
add convertedtime time

update [PL'22season]
set convertedtime = time

--maximum match attendance
select convertedate, home_team, away_team, attendance,
max(attendance) maxattendance
from [PL'22season]
group by attendance, convertedate,home_team, away_team
order by maxattendance desc

--total count of yellow cards collected by teams
select convertedate, home_team, ht_home_red,
		 ht_home_yellow, away_team, sum(ht_away_yellow)
from [PL'22season]
where away_team = 'arsenal fc'
group by convertedate, home_team, ht_home_red,
		 ht_home_yellow, away_team
order by convertedate desc

--total passes by away team 
select sum(ht_away_passes) as awaytotalpass
from [PL'22season]

select sum(ht_away_passes) as awaytotalpass
from [PL'22season]
where away_team = 'Manchester City FC'


-- count of passes by home teams and total HT shots on target
-- and away team HT assist
select count(ht_home_passes) pass, 
sum(ht_home_shots_on_target) shots, home_team, ht_away_assists
from [PL'22season]
group by home_team, ht_away_assists
order by shots desc
