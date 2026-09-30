# FinNova Digital Lending, Credit Risk & Collections Analytics

## Project Overview

FinNova Digital Lending is an end-to-end Data Analyst portfolio project for a fictional digital lender. The project uses synthetic lending data to analyze the complete lifecycle from customer acquisition and loan application through credit assessment, disbursement, repayment, delinquency, default and collections.

The project demonstrates practical skills in business understanding, data cleaning, Python EDA, Snowflake, SQL, data modeling, DAX and Power BI.

> **Data note:** The dataset is synthetic and does not represent any real financial institution or real customers.

## Business Problem

A digital lender needs to grow its loan portfolio while monitoring credit quality, delinquency, overdue exposure and collections performance.

The project focuses on portfolio growth, credit-risk segmentation, default and delinquency monitoring, DPD and overdue exposure, customer/channel patterns, and collections activity.

## Business Questions

1. How large is the disbursed loan portfolio?
2. What is the portfolio default rate?
3. How does observed default rate vary across risk segments?
4. How is the portfolio distributed across DPD buckets?
5. How much overdue exposure exists?
6. How do customer types and acquisition channels differ in observed risk?
7. How are collections distributed across actions and DPD buckets?
8. Which risk and collections KPIs should management monitor?

## Dataset

| Table | Records |
|---|---:|
| Customers | 50,000 |
| Applications | 100,000 |
| Credit Assessments | 100,000 |
| Loans | 48,702 |
| Repayments | 465,782 |
| Collections | 31,477 |
| Loan Status History | 465,782 |

Analysis period: **January 2024 – December 2025**.

## Technology Stack

- Python — pandas, NumPy, data cleaning and EDA
- Snowflake — cloud data warehouse
- SQL — joins, transformations, analytical views and KPIs
- Power BI — data model, DAX and dashboards
- Git/GitHub — version control and portfolio documentation

## Project Workflow

```text
Business Understanding
        ↓
Data Design & Data Dictionary
        ↓
Data Quality & Cleaning
        ↓
Python EDA
        ↓
Snowflake Data Warehouse
        ↓
SQL Analytical Views
        ↓
KPI & Risk Analysis
        ↓
Power BI + DAX
        ↓
Business Insights & Recommendations
```

## Key Results

The Power BI analytical model reports:

- **48,702** disbursed loans
- Approximately **₹72.72 Cr** total disbursed amount
- Approximately **₹1.49 lakh** average loan amount
- **2,531** defaulted loans
- **5.20%** portfolio default rate
- Approximately **₹22.78 Cr** total overdue amount
- **308** loans currently at 90+ DPD
- Approximately **₹12.49 Cr** collection amount

The 90+ DPD/default convention is a **project-specific analytical rule**.

## Power BI Dashboard

### Page 1 — Executive Overview
Portfolio KPIs, monthly disbursement trend, DPD distribution, risk-grade default rate, acquisition-channel analysis, loan-type disbursement, customer-type default rate and portfolio slicers.

### Page 2 — Risk & Collections
Delinquency rate, 90+ DPD exposure, average DPD, collection amount, DPD-based collection analysis, collection activity and collection amount by action.

## Important Analytical Notes

- The dataset is synthetic.
- 90+ DPD is a project-specific default convention.
- Latest DPD is point-in-time; maximum DPD represents worst observed delinquency.
- Segment differences are descriptive associations, not causal conclusions.
- Collection amount alone does not establish collection effectiveness.
- Recent cohorts may have less time to mature to 90+ DPD.

## Repository Structure

```text
FinNova-Digital-Lending-Analytics/
├── README.md
├── 01_Business_Understanding/
├── 02_Data/
├── 03_Data_Cleaning/
├── 04_EDA/
├── 05_SQL/
├── 06_PowerBI/
└── 07_Documentation/
    └── Project_Report.md
```
