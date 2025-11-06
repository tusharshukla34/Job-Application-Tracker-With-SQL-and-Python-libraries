-- create database
create database job_tracker;
use job_tracker;

-- ==============================
-- 1️⃣ Applicants table
-- ==============================
create table applicants (
    applicant_id int auto_increment primary key,
    name varchar(100) not null,
    email varchar(150) unique not null
);

-- Sample data for applicants
insert into applicants (name, email) values
('Tushar Sharma', 'tushar.sharma@email.com'),
('Aditi Mehta', 'aditi.mehta@email.com'),
('Rohit Verma', 'rohit.verma@email.com'),
('Neha Singh', 'neha.singh@email.com');

-- ==============================
-- 2️ Applications table
-- ==============================
create table applications (
    app_id int AUTO_INCREMENT PRIMARY KEY,
    company_name varchar(120) not null,
    job_role varchar(100) not null,
    status ENUM('Applied', 'interview', 'Rejected', 'selected') default 'Applied',
    date_applied date not null,
    applicant_id int,
    foreign key(applicant_id) references applicants(applicant_id)
);

insert into applications (company_name, job_role, status, date_applied, applicant_id) values
-- Tushar's applications
('Google', 'Data Analyst', 'interview', '2025-08-10', 1),
('Amazon', 'Research Associate', 'Rejected', '2025-07-28', 1),
('Infosys', 'Data Scientist', 'Applied', '2025-09-05', 1),
('Accenture', 'ML Engineer', 'selected', '2025-09-20', 1),
('TCS', 'Python Developer', 'Applied', '2025-09-25', 1),
('Wipro', 'Business Analyst', 'interview', '2025-10-02', 1),
('Deloitte', 'Research intern', 'Rejected', '2025-10-10', 1),
('Meta', 'AI Engineer', 'Applied', '2025-10-20', 1),
('Flipkart', 'Data Engineer', 'interview', '2025-10-28', 1),
('KPMG', 'Data Analyst', 'selected', '2025-09-30', 1),

-- Aditi's applications
('Google', 'AI Researcher', 'Applied', '2025-09-15', 2),
('TCS', 'Data Analyst', 'Rejected', '2025-08-18', 2),
('IBM', 'Machine Learning Engineer', 'interview', '2025-10-02', 2),
('Infosys', 'Business Analyst', 'Applied', '2025-10-10', 2),
('HCL', 'Research Assistant', 'Rejected', '2025-09-22', 2),
('Accenture', 'Data Scientist', 'selected', '2025-09-27', 2),
('EY', 'AI Analyst', 'interview', '2025-10-04', 2),
('Capgemini', 'ML Engineer', 'Applied', '2025-10-08', 2),

-- Rohit's applications
('Google', 'Data Engineer', 'Applied', '2025-08-12', 3),
('Amazon', 'Research intern', 'interview', '2025-08-28', 3),
('Infosys', 'Data Analyst', 'Rejected', '2025-09-04', 3),
('Accenture', 'AI Developer', 'Applied', '2025-09-21', 3),
('Flipkart', 'Data Scientist', 'interview', '2025-10-01', 3),
('TCS', 'Python Developer', 'selected', '2025-10-05', 3),
('Wipro', 'ML Engineer', 'Rejected', '2025-10-10', 3),
('Tech Mahindra', 'Data Engineer', 'Applied', '2025-10-15', 3),

-- Neha's applications
('IBM', 'Data Scientist', 'Applied', '2025-08-18', 4),
('HCL', 'Research Associate', 'Rejected', '2025-09-02', 4),
('EY', 'AI Analyst', 'interview', '2025-09-10', 4),
('Deloitte', 'Data Engineer', 'Applied', '2025-09-25', 4),
('Accenture', 'ML Engineer', 'selected', '2025-09-30', 4),
('KPMG', 'Data Analyst', 'interview', '2025-10-10', 4),
('Meta', 'AI Researcher', 'Rejected', '2025-10-15', 4),
('Infosys', 'Python Developer', 'Applied', '2025-10-20', 4);

-- ==============================
-- 3️ interviews table (Optional)
-- ==============================
create table interviews (
    interview_id int AUTO_INCREMENT PRIMARY KEY,
    app_id int,
    interview_date DATE,
    feedback TEXT,
    foreign key(app_id) references applications(app_id)
);

-- Sample interviews
insert into interviews (app_id, interview_date, feedback) VALUES
(1, '2025-08-20', 'Strong technical knowledge, needs clarity on project goals.'),
(6, '2025-10-05', 'Good analytical skills, follow-up round needed.'),
(13, '2025-10-08', 'Excellent presentation, shortlisted for next round.'),
(22, '2025-10-03', 'Needs to improve SQL fundamentals.'),
(29, '2025-10-12', 'Confident and clear, high chance of selection.'),
(30, '2025-10-16', 'Average performance, not shortlisted.');

-- ==============================
--  Verify
-- ==============================
select * from applicants;
select * from applications;
select * from interviews;




-- 1. Total number of applications by status (Applied, Interview, Rejected, Selected).

select status, count(*) as Count_of_status from applications group by status;


-- 2. Applications per month (trend over time).

select date_format(date_applied , '%Y-%M') as month, count(app_id) as Total_application_per_month from applications
 group by month order by min(date_applied);


-------------------------------------------------- Company Analysis

-- 3. Top 5 companies with the highest number of applications.

select company_name, count(app_id) as Number_of_application from applications
 group by company_name order by Number_of_application desc limit 5 ;

-- 4. Rejection rate per company (who rejects the most?).

select company_name,count(*) as Number_of_rejected, 
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM applications WHERE company_name = a.company_name), 2) AS Rejection_Rate_Percent 
from applications a where status = 'rejected' 
group by company_name order by Number_of_rejected desc;


-------------------------------------------------- Applicant Analysis

-- 5. Total applications submitted per applicant.

select a.name, count(*) as number_of_applications from applicants a join applications app on a.applicant_id = app.applicant_id
group by a.name;


-- 6. Selection rate per applicant (who’s doing best?).

SELECT 
    a.name,
    COUNT(CASE WHEN app.status = 'selected' THEN 1 END) AS selected_count,
    COUNT(*) AS total_applications,
    ROUND(
        COUNT(CASE WHEN app.status = 'selected' THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS selection_rate_percent
FROM applicants a
JOIN applications app ON a.applicant_id = app.applicant_id
GROUP BY a.name
ORDER BY selection_rate_percent DESC;


----------------------------------------------------- Role Insights

-- 7. Top 5 most applied job roles.

select job_role,count(*) as Number_of_application from applications group by job_role order by Number_of_application desc limit 5;

-- 8. Status distribution per role (Applied, Interview, Rejected, Selected).


select job_role, status, count(*) AS count_per_status from applications
group by job_role, status
order by job_role, count_per_status DESC;

