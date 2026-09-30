# FinNova Digital Lending, Credit Risk & Collections Analytics — Project Report

## 1. Executive Summary

FinNova is a fictional digital lender created for this portfolio project. Synthetic relational data was designed to simulate the lending lifecycle from customer acquisition and application through credit assessment, disbursement, repayment, delinquency, default and collections.

The objective was to build an end-to-end analytical solution for portfolio performance, credit risk, delinquency and collections monitoring.

## 2. Business Context

Digital lenders need to balance portfolio growth with credit quality and collections performance. The analysis therefore focuses on portfolio growth, credit risk, delinquency/DPD, overdue exposure and collections.

## 3. Business Problem

The business needs a centralized analytical view to understand portfolio size, default and delinquency, risk-segment performance, overdue exposure, customer/channel patterns and collections activity.

## 4. Stakeholders

- **Credit/Risk Manager:** credit quality, DPD and default monitoring
- **Collections Manager:** delinquent accounts and recovery
- **Business/Lending Head:** portfolio growth and loan mix
- **Finance:** disbursement, outstanding, due and paid amounts
- **Marketing/Acquisition:** customer and channel performance
- **Data/BI Analyst:** data quality, KPIs, SQL and reporting

## 5. Business Questions

### Portfolio
- How many loans were disbursed?
- What is total disbursed value?
- What is the average loan amount?
- How does disbursement change over time?

### Credit Risk
- What is the default rate?
- How does observed default rate vary by risk grade?
- Which customer and acquisition segments show different observed risk?

### Delinquency
- How many loans are current or delinquent?
- What is the DPD distribution?
- How much overdue exposure exists?
- How many loans are currently at 90+ DPD?

### Collections
- How much has been collected?
- How many collection actions were recorded?
- How are collections distributed across DPD buckets?
- How are collection amounts distributed across actions?

## 6. Dataset

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

## 7. Synthetic Data Approach

Real customer-level lending data is confidential. Therefore, synthetic data was created for this portfolio project. The data models realistic relationships among customers, applications, credit assessments, loans, repayments, collections and loan-status history.

Intentional data-quality issues were included to demonstrate a realistic cleaning workflow.

## 8. Data Quality and Cleaning

The raw data contained duplicate records, missing values, inconsistent category labels, invalid credit scores, negative income/payment values, invalid dates and missing payment/collection fields.

The cleaning workflow included duplicate handling, numeric missing-value treatment, category standardization, invalid-value handling, date validation, foreign-key checks and business-rule validation.

Validation examples:
- Payment before due date: 0
- Disbursement before application: 0
- Default logic mismatches: 0
- Invalid references: 0

## 9. Exploratory Data Analysis

### Portfolio Funnel

- Applications: **100,000**
- Approved applications: **54,113**
- Disbursed loans: **48,702**
- Approval rate: **54.11%**
- Approval-to-disbursement: **90.0%**
- Application-to-disbursement: **48.7%**

### Loan Value

- Requested amount: approximately **₹211.33 Cr**
- Approved amount: approximately **₹85.14 Cr**
- Disbursed amount: approximately **₹72.72 Cr**
- Average requested amount: approximately **₹2.11 lakh**
- Average disbursed amount: approximately **₹1.49 lakh**

### Customer Type

Existing customers had an observed approval rate of approximately **74.79%**, compared with approximately **39.58%** for new customers. This is a descriptive segment difference and is not treated as proof of causality.

## 10. Snowflake Architecture

Database: `FINNOVA_DB`

Schemas:
- `RAW`
- `ANALYTICS`

Internal stage: `FINNOVA_STAGE`

The RAW schema stores source tables and the ANALYTICS schema contains reusable analytical views.

## 11. SQL Analytical Layer

The project contains analytical views for:
1. Loan master
2. Loan risk
3. Portfolio KPIs
4. Risk segment
5. Acquisition channel performance
6. DPD analysis
7. Collections analysis
8. Collections by DPD

## 12. Portfolio KPI Results

| KPI | Result |
|---|---:|
| Total Loans | 48,702 |
| Total Disbursed Amount | ~₹72.72 Cr |
| Average Loan Amount | ~₹1.49 lakh |
| Defaulted Loans | 2,531 |
| Default Rate | 5.20% |
| Total Overdue Amount | ~₹22.78 Cr |
| 90+ DPD Loans | 308 |
| Total Collection Amount | ~₹12.49 Cr |

## 13. Credit Risk Analysis

Project risk bands:
- 300–549: High Risk
- 550–649: Moderate Risk
- 650–699: Medium Risk
- 700–749: Low Risk
- 750–850: Very Low Risk

Observed default rates:
- Moderate: **7.01%**
- Medium: **6.19%**
- Low: **5.32%**
- Very Low: **4.55%**

These are descriptive observations within the synthetic portfolio.

## 14. Delinquency and DPD Analysis

| Latest DPD Bucket | Loans |
|---|---:|
| Current | 42,919 |
| 1–30 | 1,540 |
| 31–60 | 1,065 |
| 61–89 | 284 |
| 90+ | 308 |

The project uses **90+ DPD as its default convention**. Latest DPD is a point-in-time measure and should not be confused with maximum historical DPD.

## 15. Collections Analysis

The project recorded:
- **31,477** collection actions
- Approximately **₹12.49 Cr** collection amount
- **20,815** loans with collection activity

Collection actions included Call, SMS, Promise to Pay, Email and Field Follow-up.

Collection amount by action was not treated as an effectiveness ranking because action volume, exposure and account mix differ.

## 16. Power BI Dashboard

### Page 1 — Executive Overview

Includes total loans, total disbursed amount, average loan amount, default rate, overdue amount, 90+ DPD loans, monthly disbursement trend, DPD distribution, risk-grade default rate, acquisition-channel default rate, loan-type disbursement, customer-type default rate and portfolio slicers.

### Page 2 — Risk & Collections

Includes delinquency rate, 90+ DPD exposure, average DPD, collection amount, DPD-based collection analysis, loans with collection activity, collection amount by action and risk/collections observations.

## 17. Key Business Insights

1. The portfolio contains **48,702 disbursed loans** with approximately **₹72.72 Cr** in disbursed value.
2. The Power BI model reports a **5.20% portfolio default rate**.
3. There are **308 loans currently at 90+ DPD**.
4. Total overdue exposure is approximately **₹22.78 Cr**.
5. Observed default rates vary across risk segments, with higher-risk segments showing higher observed default rates.
6. Existing customers show a lower observed default rate than new customers in this synthetic portfolio.
7. Approximately **₹12.49 Cr** was collected through **31,477 collection actions**.

## 18. Business Recommendations

Management could consider:
- Monitoring higher-risk segments closely
- Tracking DPD migration before accounts reach 90+ DPD
- Prioritizing delinquent accounts using DPD severity and exposure
- Evaluating collection actions using recovery outcomes and appropriate denominators
- Monitoring portfolio growth together with default, delinquency and overdue exposure

## 19. Limitations

1. The dataset is synthetic.
2. Observed segment differences are not causal conclusions.
3. 90+ DPD is a project-specific analytical convention.
4. Latest DPD is point-in-time.
5. Recent cohorts may have less time to mature to 90+ DPD.
6. Collection amount alone cannot establish collection effectiveness.

## 20. Conclusion

The FinNova project demonstrates an end-to-end Data Analyst workflow:

**Business Understanding → Data Cleaning → Python EDA → Snowflake → SQL → Data Modeling → DAX → Power BI → Business Insights**

It demonstrates both technical analytics skills and the ability to translate lending data into business-oriented portfolio, risk and collections reporting.


