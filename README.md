# 🎯 Job Application Tracker using SQL & Python  

A data-driven project designed to **track and analyze job applications** using **MySQL** for data management and **Python (Pandas + Matplotlib)** for analysis and visualization.

---

## 📘 Project Overview  

This project helps in understanding job application trends, selection rates, and applicant performance through SQL queries and data visualization.  
It demonstrates how data analytics can simplify the job search process by organizing applications and uncovering insights for better career decisions.

---

## 🧱 Database Design  

### **Schema Structure**
The project contains three main tables:

1. **Applicants**
   - applicant_id  
   - name  
   - email  

2. **Applications**
   - app_id  
   - company_name  
   - job_role  
   - status (`Applied`, `Interview`, `Rejected`, `Selected`)  
   - date_applied  
   - applicant_id (Foreign Key → Applicants)

3. **Interviews**
   - interview_id  
   - app_id (Foreign Key → Applications)  
   - interview_date  
   - feedback  

---

## 🧩 Tools & Technologies  

- **MySQL** – Database for storing structured data  
- **Python** – Data analysis and visualization  
- **Pandas** – For data manipulation  
- **Matplotlib** – For creating clean and meaningful visualizations  
- **SQLAlchemy** – For connecting SQL and Python  

---

## 📊 Analysis & Visualizations  

### 🔹 Key SQL Queries:
1. Total applications by status  
2. Applications per month (trend)  
3. Top 5 companies by number of applications  
4. Rejection rate per company  
5. Applications submitted per applicant  
6. Selection rate per applicant  
7. Top 5 most applied job roles  

### 🔹 Visuals Created:
- Bar charts for category-based analysis  
- Line chart for monthly application trends  
- Donut chart for selection rate comparison  
- Horizontal bar chart for top job roles  

---

## 💡 Key Insights  

1. Most applications are still in *Applied* or *Interview* stages, showing ongoing efforts.  
2. Google and Amazon received the most applications — reflecting their strong employer brand.  
3. Tushar and Rohit have the best selection rates — showing well-targeted applications.  
4. Data Analyst and AI Engineer roles are the most in-demand across applicants.  

---

## 🧭 Recommendations  

- Apply strategically, not excessively — focus on matching skill sets with job roles.  
- Keep track of monthly trends to identify the best periods for applying.  
- Maintain data consistency for better tracking and comparison.  
- Analyze rejection patterns to improve future applications.  
- Use visual dashboards to make insights more actionable.  

---

## 🏁 Conclusion  

This project demonstrates how **SQL and Python can work together** to turn simple application data into actionable insights.  
It’s a step toward using **data analytics for personal productivity and smarter career planning**.  

---

## 📂 Files Included  

- `job_tracker.sql` – Database schema and sample data  
- `job_analysis.ipynb` – Python analysis notebook  
- `Job_Application_Tracker.pptx` – Presentation of insights and visuals  

---

## 👨‍💻 Author  

**Tushar Shukla**  
📧 *tusharshukla880@gmail.com*  

---

⭐ *If you found this project useful, consider giving it a star on GitHub!*
