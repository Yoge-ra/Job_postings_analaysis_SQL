/*
Query: What are the skills needed for top paying jobs?
1 To identify top paying skills by top 10 highest paying jobs.
2 To add the specific skills required for these job.
3 and Why? It proves the detailed look at which high paying jobs demand certain skills.
*/

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
    salary_year_avg 
    
