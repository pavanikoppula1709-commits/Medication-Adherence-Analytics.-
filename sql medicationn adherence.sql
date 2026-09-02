CREATE DATABASE medication_adherence;
USE medication_adherence;
CREATE TABLE patient_adherence (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    age INT,
    gender VARCHAR(20),
    medication_type VARCHAR(50),
    dosage_mg INT,
    previous_adherence INT,
    education_level VARCHAR(50),
    income INT,
    social_support_level VARCHAR(30),
    condition_severity VARCHAR(30),
    comorbidities_count INT,
    healthcare_access VARCHAR(30),
    mental_health_status VARCHAR(30),
    insurance_coverage INT,
    adherence INT
);
USE medication_adherence;

SELECT COUNT(*) AS total_rows
FROM patient_adherence;

SELECT COUNT(*) AS total_rows
FROM patient_adherence;

DESCRIBE patient_adherence;

-- overall adherence rate-- 
SELECT
    COUNT(*) AS Total_Patients,
    SUM(Adherence) AS Adherent_Patients,
    COUNT(*) - SUM(Adherence) AS Non_Adherent_Patients,
    CAST(100.0 * SUM(Adherence) / COUNT(*) AS DECIMAL(5,2)) AS Adherence_Rate_Percent
FROM medication_adherence.patient_adherence;

-- Adherence by medication type--
SELECT
    Medication_Type,
    COUNT(*) AS Total_Patients,
    SUM(Adherence) AS Adherent_Patients,
    COUNT(*) - SUM(Adherence) AS Non_Adherent_Patients,
    CAST(100.0 * SUM(Adherence) / COUNT(*) AS DECIMAL(5,2)) AS Adherence_Rate_Percent,
    AVG(CAST(Dosage_mg AS DECIMAL(10,2))) AS Average_Dosage_mg
FROM medication_adherence.patient_adherence
GROUP BY Medication_Type
ORDER BY Adherence_Rate_Percent DESC;

-- Adherence by age group and gender--
SELECT
    CASE
        WHEN Age BETWEEN 18 AND 35 THEN '18-35'
        WHEN Age BETWEEN 36 AND 50 THEN '36-50'
        WHEN Age BETWEEN 51 AND 65 THEN '51-65'
        WHEN Age > 65 THEN '65+'
        ELSE 'Unknown'
    END AS Age_Group,
    Gender,
    COUNT(*) AS Total_Patients,
    SUM(Adherence) AS Adherent_Patients,
    COUNT(*) - SUM(Adherence) AS Non_Adherent_Patients,
    CAST(100.0 * SUM(Adherence) / COUNT(*) AS DECIMAL(5,2)) AS Adherence_Rate_Percent
FROM medication_adherence.patient_adherence
GROUP BY
    CASE
        WHEN Age BETWEEN 18 AND 35 THEN '18-35'
        WHEN Age BETWEEN 36 AND 50 THEN '36-50'
        WHEN Age BETWEEN 51 AND 65 THEN '51-65'
        WHEN Age > 65 THEN '65+'
        ELSE 'Unknown'
    END,
    Gender
ORDER BY Age_Group, Gender;

-- Effect of healthcare access and insurance coverage--
SELECT
    Healthcare_Access,
    Insurance_Coverage,
    COUNT(*) AS Total_Patients,
    SUM(Adherence) AS Adherent_Patients,
    COUNT(*) - SUM(Adherence) AS Non_Adherent_Patients,
    CAST(100.0 * SUM(Adherence) / COUNT(*) AS DECIMAL(5,2)) AS Adherence_Rate_Percent
FROM medication_adherence.patient_adherence
GROUP BY
    Healthcare_Access,
    Insurance_Coverage
ORDER BY
    Healthcare_Access,
    Insurance_Coverage;
    
    -- High-risk patient groups--
    SELECT
    COUNT(*) AS High_Risk_Patients,
    SUM(Adherence) AS Adherent_High_Risk_Patients,
    COUNT(*) - SUM(Adherence) AS Non_Adherent_High_Risk_Patients,
    CAST(100.0 * SUM(Adherence) / COUNT(*) AS DECIMAL(5,2)) AS High_Risk_Adherence_Rate_Percent
FROM medication_adherence.patient_adherence
WHERE Condition_Severity = 'Severe'
  AND Healthcare_Access = 'Poor'
  AND Social_Support_Level = 'Low'
  AND Mental_Health_Status = 'Poor';
  SELECT
    Age,
    Gender,
    Medication_Type,
    Dosage_mg,
    Previous_Adherence,
    Condition_Severity,
    Healthcare_Access,
    Social_Support_Level,
    Mental_Health_Status,
    Insurance_Coverage,
    Adherence
FROM medication_adherence.patient_adherence
WHERE Condition_Severity = 'Severe'
  AND Healthcare_Access = 'Poor'
  AND Social_Support_Level = 'Low'
  AND Mental_Health_Status = 'Poor';
  
  -- Previous adherence vs. current adherence--
  SELECT
    CASE
        WHEN Previous_Adherence = 1 THEN 'Previously Adherent'
        WHEN Previous_Adherence = 0 THEN 'Previously Non-Adherent'
        ELSE 'Unknown'
    END AS Previous_Adherence_Status,

    CASE
        WHEN Adherence = 1 THEN 'Currently Adherent'
        WHEN Adherence = 0 THEN 'Currently Non-Adherent'
        ELSE 'Unknown'
    END AS Current_Adherence_Status,

    COUNT(*) AS Patient_Count,

    CAST(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (PARTITION BY Previous_Adherence)
        AS DECIMAL(5,2)
    ) AS Percentage_Within_Previous_Group
FROM medication_adherence.patient_adherence
GROUP BY Previous_Adherence, Adherence
ORDER BY Previous_Adherence, Adherence;
