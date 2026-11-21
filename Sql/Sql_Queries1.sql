SELECT * FROM intern_files.loan_application_analysis_367;

USE intern_files;

SHOW TABLES;

DESCRIBE loan_application_analysis_367;

SET SQL_SAFE_UPDATES = 0;

UPDATE loan_application_analysis_367
SET Total_Income = REPLACE(REPLACE(Total_Income, '$', ''),
',',''),
Loan_Amount = REPLACE(REPLACE(Loan_Amount, '$', ''), ',', ''); 

ALTER TABLE loan_application_analysis_367
MODIFY COLUMN Total_Income INT,
MODIFY COLUMN Loan_Amount INT;

SET SQL_SAFE_UPDATES = 1;

SELECT Total_Income, Loan_Amount
FROM loan_application_analysis_367
LIMIT 20;

SELECT COUNT(*) AS Total_Records
FROM loan_application_analysis_367;

SELECT Loan_ID, COUNT(*) AS Occurrences
FROM loan_application_analysis_367
GROUP BY Loan_ID
HAVING COUNT(*) > 1;

SELECT COUNT(*) AS Missing_Loan_IDs
FROM loan_application_analysis_367
WHERE Loan_ID IS NULL;

SELECT MIN(Loan_ID) AS First_Loan_ID, 
MAX(Loan_ID) AS Last_Loan_ID,
COUNT(*) AS Total_Records
FROM loan_application_analysis_367;

-- Query 1: Which gender accounts for the highest number of applications?
SELECT Gender, COUNT(Loan_ID) AS Total_Applications, ROUND(COUNT(Loan_ID) * 100.0 / (SELECT COUNT(*) FROM loan_application_analysis_367), 2) AS Application_Percentage
FROM loan_application_analysis_367
GROUP BY Gender 
ORDER BY Total_Applications DESC;

-- Query 2: Which education category has the highest income
SELECT Education, COUNT(Loan_ID) AS Total_Applicants, ROUND(AVG(Total_Income), 2) AS Average_Income, ROUND(AVG(Loan_Amount), 2) AS Average_Loan_Amount
FROM loan_application_analysis_367
GROUP BY Education
ORDER BY Average_Income DESC;

-- Query 3: Are married applicants earning more than unmarried applicants?
SELECT Married, COUNT(Loan_ID) AS Total_Applicants, ROUND(AVG(Total_Income), 2) AS Average_Income, ROUND(SUM(Total_Income), 2) AS Total_Income, ROUND(AVG(Loan_Amount), 2) AS Average_Loan_Amount
FROM loan_application_analysis_367
GROUP BY Married
ORDER BY Average_Income;

-- Query 4: How does the number of dependents relate to applicant income?
 SELECT Dependents, COUNT(Loan_ID) AS Total_Applicants, ROUND(AVG(Total_Income), 2) AS Average_Income, ROUND(AVG(Loan_Amount), 2) AS Average_Loan_Amount
 FROM loan_application_analysis_367
 GROUP BY Dependents
 ORDER BY 
 CASE 
 WHEN Dependents = '3+' THEN 4
 ELSE CAST(Dependents AS UNSIGNED) 
 END;
 
 -- Query 5: Which Property Area has the highest demand
 SELECT Property_Area, COUNT(Loan_ID) AS Total_Applications, ROUND(SUM(Loan_Amount), 2)AS Total_Loan_Demand, ROUND(AVG(Loan_Amount), 2) AS Average_Loan_Amount
 FROM loan_application_analysis_367
 GROUP BY Property_Area
 ORDER BY Total_Loan_Demand;
 
 -- Query 6: Are self employed applicants requesting larger loans
 SELECT Self_Employed, COUNT(Loan_ID) AS Total_Applicants, ROUND(AVG(Total_Income), 2) AS Average_Income, ROUND(AVG(Loan_Amount), 2) AS Average_Loan_Amount, ROUND(SUM(Loan_Amount),2 ) AS Total_Loan_Demand
 FROM loan_application_analysis_367
 GROUP BY Self_Employed
 ORDER BY Average_Loan_Amount DESC;
 
 -- Query 7: What is the relationship between total income and loan amount
 SELECT
	CASE
		WHEN Total_Income < 5000 THEN 'Low Income'
        WHEN Total_Income BETWEEN 5000 AND 10000 THEN 'Lower-Middle Income'
        WHEN Total_Income BETWEEN 10001 AND 20000 THEN 'Upper-Middle Income'
        ELSE 'High Income'
        END AS Income_Category,
        COUNT(Loan_ID) AS Total_Applicants, ROUND(AVG(Total_Income), 2) AS Average_Income, ROUND(AVG(Loan_Amount), 2) AS Average_Loan_Amount, ROUND(SUM(Loan_Amount), 2) AS Total_Loan_Demand
        FROM loan_application_analysis_367
        GROUP BY Income_Category
        ORDER BY Average_Income; 