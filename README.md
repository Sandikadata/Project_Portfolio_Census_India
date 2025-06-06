# Project_Portfolio_Census_India
This project analyzes Indian district-wise census data including literacy rates, population counts, sex ratios, and growth rates. Using SQL queries on PostgreSQL, it answers critical demographic questions, identifies top and bottom performing states, and computes various aggregated and comparative statistics.
# Data set :
Census_Literacy.csv	Contains district-wise literacy rates, sex ratios, and growth rates.
Census_Population.csv	Contains district-wise current population and area data.

# Problem Statement
To perform comprehensive data analysis on India’s census data and answer key questions such as:
What is India’s total population?
Which states have the highest and lowest literacy rates?
What is the average sex ratio by state?
Which states show the highest and lowest growth rates?
Population distribution by gender.
Changes in population between census years.
Ranking top 3 districts per state by literacy rate.
# SQL Tasks Performed
Key queries written and executed in PostgreSQL include:
1.Counting records in each dataset.
2.Filtering records for specific states like Bihar and Jharkhand.
3.Calculating India’s total population.
4.Computing average growth rates nationally and per state.
5.Ranking states by average literacy rates, identifying top and bottom performers.
6.Deriving average sex ratios.
7.Combining datasets using JOIN to calculate male and female population distribution.
8.Creating views and temporary tables for top and bottom state literacy rates.
9.Using WINDOW functions to rank top 3 districts by literacy rate within each state.
10.Calculating literate and illiterate population counts per state.
11.Comparing population to geographical area.
12.Using UNION and advanced filtering with pattern matching queries.

