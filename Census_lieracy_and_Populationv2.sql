 select * from  Census_literacy
select * from Census_population

--number of row in data set
select count(*) from Census_literacy
select count(*) from Census_population

---dataset for jharkhand and bihar
Select * from Census_literacy
where state in('Jharkhand','Bihar')

--calcualte population in india
select sum(population) population from Census_population

----Avg Growth India
select avg(Growth)*100 avg_growth from Census_literacy

--avg Growth State
select state, avg(Growth)*100 avg_growth from Census_literacy
group by state 
order by 1 asc
---avg sex ratio
select state, round(avg(Sex_Ratio),0) avg_sex_ratio  from Census_literacy
group by state 
order by 2 DESC

---avg literacy
Select state,round(avg(Literacy)::numeric,0) as avg_literacy_ratio 
from Census_literacy
group by state 
having round(avg(Literacy)::numeric,0)>90
order by 2 DESC

--top 3 states showing highest growth ratio
Select  state, avg(Growth)*100  as avg_growth_ratio from Census_literacy
group by state
order by avg_growth_ratio desc
limit 3

---bottom 3 state showing lowest 3 ratio
Select  state, avg(Sex_ratio)  as avg_sex_ratio from Census_literacy
group by state
order by avg_sex_ratio asc
limit 3

---top and bottom 3 state in literacy state
drop table if exists topstates;
create table topstates
(state varchar(255),
avg_literacy_ratio float
);

insert into topstates(state,  avg_literacy_ratio)
select state, round(avg(Literacy)::numeric,0) as avg_literacy_ratio from Census_literacy
group by state
order by avg_literacy_ratio desc;

 select from topstates;
 
drop view if exists topstates_view;
 create view  topstates_view as
select state, round(avg(Literacy)::numeric,0) as avg_literacy_ratio from Census_literacy
 group by state
order by avg_literacy_ratio desc;

select * from topstates order by topstates.avg_literacy_ratio desc limit 3

------bottomstate
drop table if exists bottomstates;
create table bottomstates
(state varchar(255),
avg_literacy_ratio float
);

insert into bottomstates(state,  avg_literacy_ratio)
select state, round(avg(Literacy)::numeric,0) as avg_literacy_ratio from Census_literacy
group by state
order by avg_literacy_ratio asc;

 select from bottomstates;
 
drop view if exists bottomstates_view;
 create view  bottomstates_view as
select state, round(avg(Literacy)::numeric,0) as avg_literacy_ratio from Census_literacy
 group by state
order by avg_literacy_ratio asc;

select * from bottomstates order by bottomstates.avg_literacy_ratio asc limit 3




--union operator 
select*from (
select * from topstates order by topstates.avg_literacy_ratio desc limit 3) a
union 
select*from (
Select * from bottomstates order by bottomstates.avg_literacy_ratio asc limit 3) b;

---states starting with letter a
Select distinct state from Census_literacy
where lower(state) like 'a%'or lower(state) like 'm%'

----state with end letter
Select distinct state from Census_literacy
where lower(state) like 'a%s'


---joining both table
select d.state, sum(d.male)total_male, sum(d.female) toatal_females from
(SELECT
lp.district,
lp.state,
Round(((lp.population) / (lp.sex_ratio+1)),0) AS male,
Round((lp.population * lp.sex_ratio)/(lp.sex_ratio + 1),0) AS female 
From (Select 
l.district,
l.state,
(l.sex_ratio/1000) as sex_ratio,
population from Census_literacy l
inner join 
Census_population p
on 
l.district = p.district)lp)d
group by d.state


--total literacy rate
select c.state,sum(literate_people) total_literate_people,sum(illiterate_people) total_illiterate_people from
(select d.state,d.literacy_ratio *d.population literate_people,(1-literacy_ratio)*population illiterate_people from
(select a.district,a.state,a.literacy/100 Literacy_ratio,b.population from Census_literacy a inner join Census_population b on a.district=b.district)d)c
group by c.state 

-----population in previous census

select sum(m.previous_census_population) previous_census_population, sum(m.current_census_population) current_census_population from (
select e.state, sum(e.previous_census_population) previous_census_population, sum(e.current_census_population) current_census_population from
(select d.state,d.population/(1+d.growth) previous_census_population, d.population current_census_population from
(select a.district, a.state, a.growth, b.population from Census_literacy a inner join Census_population b on a.district=b.district) d) e
group by state
)m
----population vs area
select g.total_area/g.previous_census_population previous_census_population_vs_area, g.total_area/g.current_census_population  current_census_population_vs_area from
(select q.*,r.* from (
select '1' as keyy, n.* from
(select sum(m.previous_census_population) previous_census_population, sum(m.current_census_population) current_census_population from 
(select e.state, sum(e.previous_census_population) previous_census_population, sum(e.current_census_population) current_census_population from
(select d.state, d.population/(1+d.growth) previous_census_population, d.population current_census_population from 
(select a.district, a.state, a. growth, b.population from Census_literacy a inner join Census_Population b on a.district=b.district)d) e
group by e.state)m)n) q inner join (

select '1' as keyy, z.* from (
select sum(area_km2) total_area from Census_population)z) r on q.keyy=r.keyy)g

----window
output top 3 distinct from each state with highest literacy rate

Select a.* from
 (select district, state,literacy, rank() over (partition by state order by literacy desc) rnk from Census_literacy) a
 where a.rnk in (1,2,3) order by state


