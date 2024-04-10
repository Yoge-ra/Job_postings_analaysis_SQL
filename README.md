# Introduction

Welcome to my repository! Here, I have conducted an analysis on 2023 job postings within data analysis field by using SQL. Through the analysis, I aim to gain insights into the trends and skill requirements of data analysis roles in 2023.

A special thanks to my mentor, [@Luke Barousse](https://github.com/lukebarousse), for his invaluable guidance throughout this project.

## Tools I Used

 - **SQL :** SQL (Structured Query Language) is used for quering and managing relational databases.

 - **PostgreSQL :** PostgreSQL is an open-sourcce relational database management system (RDBMS) known for its reliability and robustness.

 - **VS Code :** Visual Studio Code is a lightweight powerful score code editor that supports various programming language and features for efficient development.

 - **CMD :** CMD (Command Line) interface is used for execute commands to interact with the operating system and version control systems like Git for pushing repository to GitHub.  


 # Analysis

 Qurey 1 : **What are the top 10 paying data analyst jobs?** 
    
To find the top 10 highest paying job, i filtered the average salary and location("Anywhere).
```SQL
SELECT 
    name as company_name,
    job_title,
    salary_year_avg
FROM 
    job_postings_fact
LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id 
WHERE 
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
**Result :**

| Company Name | Role | Avg_salary_year|
|--------------|------|-------------------------|
| Mantys | Data Analyst | 650000|
| Meta | Director of analysis | 336500|
| AT&T | Associaate Director | 255829|
| Pinterest Job Advertisements | Data Analyst,Marketing | 232423|
| UclaHealthcareers | Data Analyst (Hybrid/Remote)| 217000|
| SmartAsset | Principal Data Analyst (Remote)| 205000|
| Inclusively | Director, Data Analyst-HYBIRD| 189309|
| Motional | Principal Data Analyst,AV Performance Analysis | 189000|
| SmartAsset | Principal Data Analyst | 186000|
| Get It Recruit - Information Technology | ERM Data Analyst | 184000|

 Qurey 2 : **What are the skills needed for top paying jobs?**
    
To find the skills required for top paying Data analyst job, I filtered the skills based Data analyst job title and salary average per year.
```SQL
WITH top_paying_jobs as (
    SELECT 
        job_id,
        name as company_name,
        job_title,
        salary_year_avg
    FROM 
        job_postings_fact
    LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id 
    WHERE 
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

select 
    top_paying_jobs.*,
    skills
From 
    top_paying_jobs 
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY
    salary_year_avg;
```
**Key Findings :**
Here are the top skills required for Top 10 Paying Data Analyst Jobs 2023.
| S.NO | Skills |
|---|----|
|1| SQL|
|2| Python|
|3| Tableau |
|4| R programming |
|5| SnowFlake |
|6| Pandas |
|7| Excel |
|8| Azure |
|9| BitBucket |
|10| go |

Qurey 3 : **What are the optimal skills to learn by high demand skills and high paying role?**
    
To find the most optimal skills required for high demand skills and high pying job, I filtered the skills based skill demand and salary average per year.

# Conclusion

From the analysis, serveral general insights emerged: 

1. **Top Paying Data Analysis Job :** The highest paying jobs for DA that allow remote work offers wide range of salaries upto $650000.

2. **Skills for Top Paying Jobs :** High paying DA jobs require advanced proficiency in SQL.

3. **Optimal Skills for Job Market Value :** SQL leads in demand and offers for a high average salary.


