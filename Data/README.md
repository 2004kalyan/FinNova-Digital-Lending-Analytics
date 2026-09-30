# FinNova Digital Lending — Data

## Dataset Overview

This project uses synthetically generated data to simulate a digital lending business called **FinNova**.

The dataset represents the lending lifecycle:

**Customer → Application → Credit Assessment → Approval → Disbursement → Repayment → Delinquency → Collections → Default**

The data was created for educational and portfolio purposes because real customer-level lending data is confidential.

## Dataset Scope

The full project dataset contains approximately:

- 50,000 customers
- 100,000 loan applications
- 100,000 credit assessments
- 48,702 disbursed loans
- 465,782 repayment records after cleaning
- 31,477 collection records
- 465,782 loan status history records

The analysis covers the period **January 2024 to December 2025**.

## Tables

| Table | Description |
|---|---|
| customers | Customer demographics, employment and income information |
| applications | Loan application and approval information |
| credit_assessments | Credit score, DTI, employment and risk assessment |
| loans | Disbursed loan details and loan status |
| repayments | Installments, payments, DPD and default indicators |
| collections | Collection actions and recovery information |
| loan_status_history | Historical loan status and DPD information |

## Data Quality

The raw layer intentionally contains realistic data-quality issues such as:

- Duplicate records
- Missing values
- Inconsistent category labels
- Invalid credit scores
- Negative income/payment values
- Invalid dates
- Missing payment dates
- Missing collection fields

These issues were addressed during the data-cleaning stage while preserving the original raw data.

## Important Analytical Note

The dataset is synthetic and does not represent any real financial institution or real customers.

The project's **90+ DPD = Default** rule is a project-specific analytical convention and should not be interpreted as a universal regulatory definition.

Segment differences are treated as descriptive associations rather than proof of causation.

## Repository Data Policy

The full dataset was used for the analysis, Snowflake transformations and Power BI dashboard. Representative sample data may be included in the repository to keep the GitHub project lightweight and easy to review.
