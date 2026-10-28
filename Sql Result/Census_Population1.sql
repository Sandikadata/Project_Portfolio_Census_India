
create table Census_Population
(
District varchar(100),
State 	varchar(100),
area_km2 bigint, 
population Bigint
);
select * from Census_Population;
COPY Census_Population FROM 'E:\sandika\Data analytics project\DASHBOARD\Census India SQL\Census_Population.csv' 
WITH (FORMAT csv, HEADER true);
