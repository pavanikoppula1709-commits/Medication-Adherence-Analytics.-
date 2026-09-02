# Medication-Adherence-Analytics.-
# 💊 Medication Adherence Analytics

## 📌 Project Overview

This project analyzes **patient medication adherence** using Python, SQL, and Power BI to identify factors associated with medication adherence and non-adherence.

The analysis examines demographic, clinical, socioeconomic, healthcare-access, mental-health, and medication-related factors to understand which patient groups may require additional adherence support.

The project demonstrates an end-to-end **Healthcare & Clinical Data Analytics** workflow:

**Raw Patient Data → Data Cleaning → Exploratory Data Analysis → SQL Analysis → KPI Development → Power BI Dashboard → Insights**

---

## 🎯 Business Problem

Medication non-adherence can negatively affect treatment outcomes and create additional challenges for healthcare providers and clinical teams.

Healthcare organizations need to understand:

* What is the overall medication adherence rate?
* Which medication types have the highest adherence?
* Does adherence vary by age and gender?
* Does healthcare access affect medication adherence?
* Does insurance coverage influence adherence?
* How does previous adherence relate to current adherence?
* Which patients belong to potentially high-risk groups for non-adherence?

### Objective

The objective of this project is to analyze patient adherence data and identify **patterns, risk factors, and patient segments associated with medication adherence**.

These insights can help healthcare and clinical teams improve patient monitoring and design targeted adherence-support strategies.

---

# 📊 Dataset

The dataset contains **5,000 patient records and 14 variables**.

### Key Variables

| Variable               | Description                         |
| ---------------------- | ----------------------------------- |
| `Age`                  | Patient age                         |
| `Gender`               | Patient gender                      |
| `Medication_Type`      | Type of medication                  |
| `Dosage_mg`            | Medication dosage                   |
| `Previous_Adherence`   | Previous adherence status           |
| `Education_Level`      | Patient education level             |
| `Income`               | Patient income                      |
| `Social_Support_Level` | Level of social support             |
| `Condition_Severity`   | Severity of the patient's condition |
| `Comorbidities_Count`  | Number of comorbidities             |
| `Healthcare_Access`    | Level of access to healthcare       |
| `Mental_Health_Status` | Mental health status                |
| `Insurance_Coverage`   | Insurance coverage status           |
| `Adherence`            | Current medication adherence status |

### Target Variable

`Adherence`

```text
1 = Adherent
0 = Non-Adherent
```

---

# 🛠️ Tools & Technologies

| Tool          | Purpose                                     |
| ------------- | ------------------------------------------- |
| 🐍 Python     | Data cleaning and exploratory data analysis |
| 🐼 Pandas     | Data manipulation                           |
| 🔢 NumPy      | Numerical operations                        |
| 📊 Matplotlib | Data visualization                          |
| 📈 Seaborn    | Statistical visualization                   |
| 🗄️ MySQL     | Patient adherence analysis                  |
| 📊 Power BI   | Interactive dashboard and KPI reporting     |
| 📁 CSV        | Dataset storage                             |

---

# 🐍 Python Analysis

Python was used to inspect, clean, and explore the medication adherence dataset.

### Data Preparation

The analysis included:

* Loading the patient dataset
* Checking dataset dimensions
* Inspecting data types
* Exploring the dataset structure
* Reviewing patient-level variables
* Preparing cleaned data for further analysis

The original dataset contains:

```text
5,000 rows
14 columns
```

The cleaned dataset was exported for use in subsequent analysis and visualization.

---

# 🗄️ SQL Analysis

MySQL was used to perform structured analysis of patient medication adherence.

A dedicated database and table were created:

```sql
CREATE DATABASE medication_adherence;
```

The patient-level data was then loaded into:

```text
patient_adherence
```

---

## 🔎 Key SQL Analyses

### 1. Overall Medication Adherence

Calculated:

* Total patients
* Adherent patients
* Non-adherent patients
* Overall adherence rate

Example KPI:

```text
Adherence Rate =
Adherent Patients / Total Patients × 100
```

---

### 2. Adherence by Medication Type

Compared different medication types based on:

* Total patients
* Adherent patients
* Non-adherent patients
* Adherence rate
* Average dosage

This helps identify medication types with relatively higher or lower adherence.

---

### 3. Adherence by Age Group & Gender

Patients were segmented into:

```text
18–35
36–50
51–65
65+
```

Adherence was then compared across:

* Age groups
* Gender

This provides a demographic view of medication adherence.

---

### 4. Healthcare Access & Insurance Coverage

Analyzed adherence based on combinations of:

* Healthcare access
* Insurance coverage

This helps investigate whether access to healthcare and insurance status are associated with differences in medication adherence.

---

### 5. High-Risk Patient Group Analysis

A specific patient segment was defined using multiple risk factors:

```text
Condition Severity = Severe
Healthcare Access = Poor
Social Support = Low
Mental Health Status = Poor
```

The analysis calculates:

* Number of high-risk patients
* Adherent high-risk patients
* Non-adherent high-risk patients
* High-risk adherence rate

Individual high-risk patient records were also extracted for further investigation.

---

### 6. Previous vs Current Adherence

The project compares previous adherence status with current adherence status.

This identifies transitions such as:

```text
Previously Adherent → Currently Adherent

Previously Adherent → Currently Non-Adherent

Previously Non-Adherent → Currently Adherent

Previously Non-Adherent → Currently Non-Adherent
```

This analysis helps understand whether previous adherence behavior is associated with current adherence.

---

# 📊 Power BI Dashboard

Power BI was used to transform the analysis into an interactive medication adherence dashboard.

### Dashboard Focus

The dashboard provides a visual overview of:

* Patient population
* Medication adherence
* Non-adherence
* Medication type performance
* Demographic patterns
* Healthcare access
* Insurance coverage
* Previous adherence
* High-risk patient groups

### Suggested KPI Metrics

```text
Total Patients
Adherent Patients
Non-Adherent Patients
Overall Adherence Rate
High-Risk Patients
High-Risk Adherence Rate
Average Dosage
```

---

# 📈 Key Business Questions Answered

The project addresses the following analytical questions:

### Medication

* Which medication type has the highest adherence rate?
* Which medication type has the lowest adherence rate?
* How does average dosage vary between medication types?

### Demographics

* How does medication adherence vary by age?
* Are there differences in adherence between genders?

### Healthcare Access

* Does poor healthcare access correspond with lower adherence?
* How does insurance coverage relate to adherence?

### Patient History

* Are previously adherent patients more likely to remain adherent?
* How many previously non-adherent patients become adherent?

### Patient Risk

* How many patients meet the high-risk criteria?
* What proportion of high-risk patients are non-adherent?

---

# 💡 Business & Clinical Value

This analysis can help healthcare and clinical teams:

* Monitor medication adherence patterns
* Identify patient groups with lower adherence
* Understand demographic differences
* Identify potentially high-risk patients
* Examine healthcare-access barriers
* Evaluate the relationship between previous and current adherence
* Prioritize patients for additional monitoring or support

The project demonstrates how patient-level data can be converted into **actionable healthcare insights** using analytics.

> **Important:** The identified high-risk group represents an analytical segmentation based on the available dataset. It should not be interpreted as a clinical diagnosis or validated clinical risk score.

---

# 🔄 Project Workflow

```text
                 RAW PATIENT DATA
                        │
                        ▼
                 DATA INSPECTION
                        │
                        ▼
                  DATA CLEANING
                        │
                        ▼
              EXPLORATORY DATA ANALYSIS
                        │
             ┌──────────┴──────────┐
             ▼                     ▼
        PYTHON ANALYSIS       SQL ANALYSIS
             │                     │
             └──────────┬──────────┘
                        ▼
                  KPI DEVELOPMENT
                        │
                        ▼
                 POWER BI DASHBOARD
                        │
                        ▼
               BUSINESS INSIGHTS
```

---

# 📁 Project Structure

```text
Medication-Adherence-Analytics/
│
├── patient_adherence_dataset.csv
│
├── cleaned_patient_adherence.csv
│
├── medication_adherence.ipynb
│
├── sql_medication_adherence.sql
│
├── power_bi_medication_adherence_dashboard.pbix
│
└── README.md
```

---

# 📂 Files Description

| File                                           | Description                                    |
| ---------------------------------------------- | ---------------------------------------------- |
| `patient_adherence_dataset.csv`                | Original patient adherence dataset             |
| `cleaned_patient_adherence.csv`                | Cleaned dataset used for analysis              |
| `medication_adherence.ipynb`                   | Python data preparation and EDA                |
| `sql medicationn adherence.sql`                | MySQL database creation and adherence analysis |
| `power bi medication_adherence dashoards.pbix` | Power BI interactive dashboard                 |
| `README.md`                                    | Project documentation                          |

---

# 🧠 Skills Demonstrated

## Data Analytics

* Data Cleaning
* Exploratory Data Analysis
* Data Transformation
* Patient Segmentation
* KPI Development
* Data Visualization
* Business Problem Solving

## Python

* Python
* Pandas
* NumPy
* Matplotlib
* Seaborn
* Exploratory Data Analysis

## SQL

* Database Creation
* Table Creation
* Aggregations
* `GROUP BY`
* `CASE`
* Conditional Analysis
* Percentage Calculations
* Window Functions
* Patient Segmentation
* Healthcare KPI Analysis

## Power BI

* Dashboard Development
* KPI Cards
* Interactive Visualizations
* Patient Segmentation
* Healthcare Reporting
* Data Storytelling

## Healthcare / Clinical Domain

* Medication Adherence
* Patient Outcomes
* Treatment Monitoring
* Healthcare Access
* Insurance Coverage
* Social Support
* Mental Health Factors
* Condition Severity
* Comorbidities
* Patient Risk Segmentation

---

# 🚀 End-to-End Project Outcome

This project demonstrates an end-to-end approach to **medication adherence analytics**, starting from raw patient-level data and progressing through Python analysis, SQL-based investigation, and Power BI visualization.

The final analytical solution provides a structured way to examine **adherence patterns, demographic differences, healthcare-access factors, previous adherence behavior, and potentially high-risk patient segments.**

---

# 👩‍💻 Author

**Pavana Laxmi**

B.Pharmacy Student | Data Analyst | Healthcare & Clinical Analytics

### Technical Skills

`Python` `SQL` `Excel` `Power BI` `Tableau` `Pandas` `NumPy` `Data Visualization` `Healthcare Analytics` `Clinical Data Analytics`

---

## ⭐ Project Highlights

**5,000 Patient Records**
**14 Patient Variables**
**Python EDA**
**MySQL Analysis**
**Power BI Dashboard**
**Medication Adherence Analytics**
**Patient Risk Segmentation**
