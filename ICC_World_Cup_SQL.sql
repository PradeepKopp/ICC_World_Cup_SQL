create table icc_world_cup1
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup1 values('India','SL','India');
INSERT INTO icc_world_cup1 values('SL','Aus','Aus');
INSERT INTO icc_world_cup1 values('SA','Eng','Eng');
INSERT INTO icc_world_cup1 values('Eng','NZ','NZ');
INSERT INTO icc_world_cup1 values('Aus','India','India');

select * from icc_world_cup1;

--Display No of matches played, no of wins and no of loss for each team

select Team_Name, COUNT(*) as Total_matches_Played, SUM(win_flag) as Total_wins,
COUNT(*) - SUM(win_flag) as Total_Loss from(
select Team_1 as Team_Name,
case when Team_1= Winner then 1 else 0 end as win_flag
from icc_world_cup1
union all 
select Team_2 as Team_Name, 
case when Team_2=Winner then 1 else 0 end as win_flag
from icc_world_cup1) a
group  by Team_Name
order by Total_wins desc 