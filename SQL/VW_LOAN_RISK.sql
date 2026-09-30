create or replace view VW_LOAN_RISK(
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
	LOAN_STATUS,
	MAX_DPD,
	LATEST_DPD,
	LATEST_DPD_BUCKET,
	LATEST_DUE_DATE,
	LATEST_PAYMENT_DATE,
	TOTAL_AMOUNT_DUE,
	TOTAL_AMOUNT_PAID,
	TOTAL_OVERDUE_AMOUNT,
	OUTSTANDING_PRINCIPAL,
	DEFAULT_FLAG
) as

WITH repayment_summary AS (
    SELECT
        loan_id,
        MAX(dpd) AS max_dpd,
        SUM(amount_due) AS total_amount_due,
        SUM(amount_paid) AS total_amount_paid,
        SUM(overdue_amount) AS total_overdue_amount,
        MAX(outstanding_principal) AS outstanding_principal,
        MAX(default_flag) AS default_flag
    FROM FINNOVA_DB.RAW.REPAYMENTS
    GROUP BY loan_id
),

latest_repayment AS (
    SELECT
        loan_id,
        dpd AS latest_dpd,
        dpd_bucket AS latest_dpd_bucket,
        due_date AS latest_due_date,
        payment_date AS latest_payment_date
    FROM FINNOVA_DB.RAW.REPAYMENTS
    QUALIFY ROW_NUMBER() OVER (
        PARTITION BY loan_id
        ORDER BY due_date DESC
    ) = 1
)

SELECT
    lm.*,

    rs.max_dpd,
    lr.latest_dpd,
    lr.latest_dpd_bucket,
    lr.latest_due_date,
    lr.latest_payment_date,

    rs.total_amount_due,
    rs.total_amount_paid,
    rs.total_overdue_amount,
    rs.outstanding_principal,
    rs.default_flag

FROM FINNOVA_DB.ANALYTICS.VW_LOAN_MASTER lm

LEFT JOIN repayment_summary rs
    ON lm.loan_id = rs.loan_id

LEFT JOIN latest_repayment lr
    ON lm.loan_id = lr.loan_id;