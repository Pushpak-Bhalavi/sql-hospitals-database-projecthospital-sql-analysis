SELECT * FROM hospital;

/* 1.Total Number of Patients
   o Write an SQL query to find the total number of patients across all hospitals. */

SELECT SUM(patients_count) AS total_patients	
FROM hospital;

/* 2.Average Number of Doctors per Hospital
  o Retrieve the average count of doctors available in each hospital. */

SELECT AVG(doctors_count) AS avg_doctors
FROM hospital;

/* 3.Top 3 Departments with the Highest Number of Patients
o Find the top 3 hospital departments that have the highest number of patients. */

SELECT department, SUM(patients_count)	 AS top3_department
FROM hospital
GROUP BY department
ORDER BY top3_department DESC
LIMIT 3;

/* 4.Hospital with the Maximum Medical Expenses
   o Identify the hospital that recorded the highest medical expenses. */

SELECT hospital_name, medical_expenses AS highest_expenses
FROM hospital
ORDER BY highest_expenses DESC
LIMIT 1;

/* 5.Daily Average Medical Expenses
   o Calculate the average medical expenses per day for each hospital. */

SELECT hospital_name, medical_expenses, 
      (medical_expenses/GREATEST((discharge_date - admission_date), 1)) AS daily_avg_expense 
FROM hospital;

/* 6.Longest Hospital Stay
   o Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date. */

SELECT hospital_name, location, (discharge_date - admission_date) AS Longest_stay
FROM hospital
ORDER BY longest_stay DESC
LIMIT 1;


/* 7.Total Patients Treated Per City
   o Count the total number of patients treated in each city. */

SELECT location AS city,
	   SUM(patients_count) AS total_patients
FROM hospital
GROUP BY location
ORDER BY total_patients DESC;

/* 8.Average Length of Stay Per Department
   o Calculate the average number of days patients spend in each department. */

SELECT department, AVG(discharge_date - admission_date) AS avg_stay_days
FROM hospital
GROUP BY department
ORDER BY avg_stay_days DESC;

/* 9.Identify the Department with the Lowest Number of Patients
   o Find the department with the least number of patients. */

SELECT department, SUM(patients_count) AS least_no_patients
FROM hospital
GROUP BY department
ORDER BY least_no_patients ASC
LIMIT 1;

/* 10.Monthly Medical Expenses Report
   • Group the data by month and calculate the total medical expenses for each month. */

SELECT 
  EXTRACT(MONTH FROM admission_date) AS month_number,
  TO_CHAR(admission_date, 'Month') AS month_name,
  SUM(medical_expenses) AS total_expenses
FROM hospital
GROUP BY month_number, month_name
ORDER BY month_number;


