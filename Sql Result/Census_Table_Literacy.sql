Drop table if exists Census_Literacy;
create table Census_Literacy  
(
District varchar(100),
State 	varchar(100),
Growth	float, 
Sex_Ratio Bigint,
Literacy  float
);
select * from Census_Literacy;
COPY Census_Literacy FROM 'E:\sandika\Data analytics project\DASHBOARD\Census India SQL\Census_Literacy.csv' 
WITH (FORMAT csv, HEADER true);

