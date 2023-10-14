create database IPL_CASE_STUDY;

use IPL_CASE_STUDY;

select * from ipl_2018_batsmen;

select * from ipl_2018_bowlers;

select * from ipl_2019_batsmen;

select * from ipl_2019_bowlers;

-- Name the bowlers who took 4 wickets haul(s) in 2018

select Player, Team, 4w
from ipl_2018_bowlers
where 4w > 0;

-- List the names of teams and the bowlers from 2019

select player, team
from ipl_2019_bowlers;

-- List the 2018 teams that played that had at least one bowler who took 4 wickets haul

select player, 4w, team
from ipl_2018_bowlers
where 4w > 1;

-- Name two bowlers who took most number of wickets in 2018

select Player, Wkts
from ipl_2018_bowlers
order by Wkts DESC
limit 2;

-- What are the names and teams of all Allrounders in the year 2018 and 2019? 

select a.Player, a.Team
from ipl_2018_bowlers as a inner join 
ipl_2018_batsmen as b on a.Player = b.Player;

select a.Player, a.Team
from ipl_2019_bowlers as a inner join 
ipl_2019_batsmen as b on a.Player = b.Player;

-- Show the list of batsmen who played in 2018 as well in 2019.

select a.player
from ipl_2019_batsmen as a inner join 
ipl_2018_batsmen as b on a.Player = b.Player;

-- Which bowlers took the most wickets in the 2018 season?

select wkts, player, team
from ipl_2018_bowlers
order by wkts desc
limit 1;

-- Which batsmen scored the most runs in the 2018 season while maintaining an average strike rate of at least 130?

ALTER TABLE ipl_2018_batsmen
CHANGE COLUMN `S/R` `S_R` FLOAT;

select player, S_R
from ipl_2018_batsmen
where S_R >= 130
order by player
limit 1; 

-- Which bowlers took the most wickets in the 2018 season while maintaining an economy rate of less than 7 runs per over?

ALTER TABLE ipl_2018_bowlers
CHANGE COLUMN `E/R` `E_R` FLOAT;

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

select player, E_R, wkts
from ipl_2018_bowlers
where E_R < 7
order by wkts desc
limit 1;

-- Which batsmen scored the most runs across both 2018 and 2019 seasons?

select  ipl_2018_batsmen.player,  ipl_2018_batsmen.runs
from ipl_2018_batsmen
inner join ipl_2019_batsmen on ipl_2018_batsmen.player=ipl_2019_batsmen.player
order by runs desc
limit 1;

--  Which batsmen has hit the maximum number of boundaries in 2018, combining 4s and 6s?

select player, sum(4s + 6s) as combine_boundary
from ipl_2018_batsmen
group by player
order by combine_boundary desc
limit 1;

--  Which team scored the maximum number of runs in 2019?

select team, runs
from ipl_2019_batsmen
order by team desc
limit 1;

--  Name 5 such bowlers who bowled the least number of overs in 2018.

select player, overs
from ipl_2018_bowlers
order by overs desc
limit 5;

--  Which team scored the maximum number of runs in 2019?

select team, runs
from ipl_2019_batsmen
order by team desc
limit 1;

--  Name the Batsmen who has hit maximum half centuries, both the years combined

select ipl_2018_batsmen.player, 50s as half_centuries, ipl_2018_batsmen.half_centuries
from ipl_2018_batsmen
inner join ipl_2019_batsmen on ipl_2018_batsmen.player=ipl_2019_batsmen.player
order by 50s desc
limit 1;












































































