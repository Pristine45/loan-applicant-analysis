# loan-applicant-analysis
Excel, SQL and Power BI analysis of loan applicants

# Loan Applicant Analysis: Who Applies and What Drives Loan Size

**Author:** Sadiq Kabiru Samuel, Data Analyst
**Tools:** Excel | SQL | Power BI

## Business Problem

Who are our loan applicants, and what factors influence the size of their loan requests?

## Dataset

- 317 applicants analysed, total loan demand of 1,286,310
- 11 fields: Loan_ID, Gender, Married, Dependents, Education, Self_Employed, Applicant_Income, Loan Amount, Loan Amount Term, Credit_History, Property_Area

## Questions Investigated (SQL)

1. Which gender accounts for the highest number of applications?
2. Which education category has the highest average income and loan amount?
3. Are married applicants earning more than unmarried applicants?
4. How does the number of dependents relate to applicant income?
5. Which property area has the highest loan demand?
6. Are self-employed applicants requesting larger loans?
7. What is the relationship between total income and loan amount?

## Process

1. **Clean (Excel):** fixed missing values, formats and data types
2. **Analyse (SQL):** seven grouped queries, one per question
3. **Visualise (Power BI):** four-page dashboard (General, Property Area Dive, Credit History Risk, Customer Profile)
4. **Report:** findings report (PDF) and presentation (PowerPoint)

## Dashboard Preview

![General](dashboard/screenshots/1_general.png)
![Property Area Dive](dashboard/screenshots/2_property_area.png)
![Credit History Risk](dashboard/screenshots/3_credit_risk.png)
![Customer Profile](dashboard/screenshots/4_customer_profile.png)

## Key Insights

- **Who applies:** the typical applicant is male (77.6%), a graduate (78%), married (61%), has no dependents (63%) and is in the Low or Low-Mid income bands (92%).
- **Income drives loan size, but not one-for-one:** income grows about 6.6 times from the lowest to the highest band, while the average loan grows only about 2.1 times.
- **Graduates and the self-employed request more:** about 20% and 12% larger loans than their counterparts.
- **Family situation matters:** married applicants request about 17% larger loans, and applicants with two dependents about 18% larger.
- **Property area:** Urban has the highest demand (36.8%), but average loan size is almost the same in every area.

## Recommendations

1. Segment products and outreach by income band, with loan-to-income checks
2. Offer higher limits to graduates and a dedicated product for the self-employed
3. Prioritise Urban acquisition while keeping Rural outreach active
4. Widen outreach to women and families, without using gender or marital status in credit decisions

## Limitations

- No approval or default column, so the analysis explains loan requests, not repayment risk
- Patterns show association, not cause
- Small groups (Upper-Mid income 18, High income 8, self-employed 52)
- Single snapshot with no time dimension

## Repository Structure

```
loan-applicant-analysis/
├── README.md
├── data/
│   ├── loan_data_raw.xlsx
│   └── loan_data_cleaned.xlsx
├── sql/
│   └── queries.sql
├── dashboard/
│   ├── loan_dashboard.pbix
│   └── screenshots/
├── reports/
│   ├── Loan_Applicant_Findings_Report.pdf
│   └── Loan_Applicant_Analysis_Presentation.pptx
└── docs/
    └── data_dictionary.md
```

## How to Open

- **Dashboard:** download `loan_dashboard.pbix` and open it in Power BI Desktop
- **Report and slides:** see the `reports/` folder

