Project Portfolio: Census of India — PostgreSQL Data AnalysisA robust data portfolio project exploring district-wise Census of India datasets. This repository leverages advanced PostgreSQL queries, joins, window functions, and views to uncover granular demographic trends—including population distributions, literacy rankings, and growth metrics across Indian states and union territories.

📌 Executive SummaryThe Census of India is one of the world's largest administrative and statistical operations.
This project processes raw district-level datasets (Census_Literacy.csv and Census_Population.csv) to answer critical socio-economic questions, benchmark top/bottom-performing states, and establish structured exploratory data workflows.
📁 Dataset OverviewFile NameDescriptionKey AttributesCensus_Literacy.csvDistrict-wise educational and demographic indicatorsLiteracy rates, sex ratios, growth ratesCensus_Population.csvDistrict-wise demographic aggregatesPopulation counts, geographical area data🎯 Problem Statement & ObjectivesTo perform rigorous SQL-based exploratory data analysis (EDA) on Indian census records, addressing core analytical questions:What is India's aggregate population across districts?Which states feature the highest and lowest literacy rates?What are the average sex ratios and growth rates by state?How is the population distributed by gender?Which districts rank in the top 3 per state by literacy rate?
🛠️ SQL Tasks & Technical ImplementationKey queries and database routines implemented in PostgreSQL:Dataset Auditing: Counting total records in raw datasets.Targeted Filtering: Querying subsets for specific states (e.g., Bihar, Jharkhand).Aggregations: Calculating national and state-level population totals and average growth rates.Ranking & Performance Analysis: Grouping and ordering states by average literacy rates to isolate top and bottom performers.Multi-Table Joins (JOIN): Combining population and literacy data to derive gender-wise population distributions and literate/illiterate population counts per state.Advanced SQL constructs:Creating Views and Temporary Tables for top/bottom state literacy rankings.Utilizing Window Functions (ROW_NUMBER() / RANK()) to determine the top 3 districts by literacy rate within each state.Applying UNION operators and pattern-matching filters for complex multi-condition extractions.Comparative Metrics: Contrasting population sizes against geographical area data.
📂 Repository StructurePlaintext.
├── data/
│   ├── raw/                  # Original raw datasets (Census_Literacy.csv, Census_Population.csv)
│   └── processed/            # Cleaned & standardized state-wise metrics
├── sql/
│   ├── 01_data_audit.sql     # Record counts and initial filtering
│   ├── 02_aggregations.sql   # Population totals, growth rates, and sex ratios
│   └── 03_advanced_analytics.sql # Window functions, views, joins, and rankings
├── notebooks/
│   └── 01_population_eda.ipynb   # Exploratory data analysis & visualization pipeline
├── README.md                 # Project documentation & summary report
└── requirements.txt          # Python dependencies for pipeline and notebook execution
🚀 Quickstart Guide1. Clone the RepositoryBashgit clone https://github.com/your-username/india-census-analysis.git
cd india-census-analysis
2. Set Up the PostgreSQL DatabaseExecute the SQL scripts inside your PostgreSQL environment to set up tables and execute demographic queries:Bashpsql -U your_username -d census_db -f sql/03_advanced_analytics.sql
3. Install Python Dependencies (for Notebooks)Bashpip install -r requirements.txt
📜 Source & CitationPrimary Source: Office of the Registrar General & Census Commissioner, Ministry of Home Affairs, Government of India.Open Data Portal: data.gov.in
