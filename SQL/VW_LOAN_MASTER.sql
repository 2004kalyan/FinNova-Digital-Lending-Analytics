CREATE OR REPLACE VIEW VW_LOAN_MASTER (
    LOAN_ID,
    APPLICATION_ID,
    CUSTOMER_ID,
    APPLICATION_DATE,
    REQUESTED_AMOUNT,
    APPROVED_AMOUNT,
    LOAN_TYPE,
    ACQUISITION_CHANNEL,
    APPLICATION_STATUS,
    AGE,
    GENDER,
    EMPLOYMENT_TYPE,
    MONTHLY_INCOME,
    CUSTOMER_TYPE,
    CITY,
    REGION,
    CUSTOMER_SINCE,
    CREDIT_SCORE,
    DEBT_TO_INCOME,
    EMPLOYMENT_YEARS,
    RISK_GRADE,
    DISBURSEMENT_DATE,
    DISBURSEMENT_AMOUNT,
    INTEREST_RATE,
    TENURE_MONTHS,
    LOAN_STATUS
) AS

SELECT
    l.loan_id,
    l.application_id,
    a.customer_id,
    a.application_date,
    a.requested_amount,
    a.approved_amount,
    a.loan_type,
    a.acquisition_channel,
    a.application_status,

    c.age,
    c.gender,
    c.employment_type,
    c.monthly_income,
    c.customer_type,
    c.city,
    c.region,
    c.customer_since,

    ca.credit_score,
    ca.debt_to_income,
    ca.employment_years,
    ca.risk_grade,

    l.disbursement_date,
    l.disbursement_amount,
    l.interest_rate,
    l.tenure_months,
    l.loan_status

FROM FINNOVA_DB.RAW.LOANS l

LEFT JOIN FINNOVA_DB.RAW.APPLICATIONS a
    ON l.application_id = a.application_id

LEFT JOIN FINNOVA_DB.RAW.CUSTOMERS c
    ON a.customer_id = c.customer_id

LEFT JOIN FINNOVA_DB.RAW.CREDIT_ASSESSMENTS ca
    ON a.application_id = ca.application_id;