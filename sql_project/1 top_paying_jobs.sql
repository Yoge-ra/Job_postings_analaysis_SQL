/*
Query : What are the top paying data analyst jobs?
1 To find top 10 highest paying Data Analyst roles (remotely).
2 Focuses on job postings with specified salaries (remove null).
3 Why? To highlight the oppurtunities for Data Analyst roles.
*/

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