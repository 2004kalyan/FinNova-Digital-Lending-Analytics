create or replace view VW_PORTFOLIO_KPI(
	TOTAL_LOANS,
	TOTAL_DISBURSED_AMOUNT,
	AVERAGE_LOAN_AMOUNT,
	DEFAULTED_LOANS,
	DEFAULT_RATE,
	TOTAL_OVERDUE_AMOUNT,
	TOTAL_OUTSTANDING_PRINCIPAL,
	TOTAL_AMOUNT_DUE,
	TOTAL_AMOUNT_PAID
) as

SELECT
    COUNT(DISTINCT loan_id) AS total_loans,

    SUM(disbursement_amount) AS total_disbursed_amount,

    AVG(disbursement_amount) AS average_loan_amount,

    COUNT_IF(default_flag = 1) AS defaulted_loans,

    ROUND(
        COUNT_IF(default_flag = 1) * 100.0
        / NULLIF(COUNT_IF(default_flag IS NOT NULL), 0),
        2
    ) AS default_rate,

    SUM(total_overdue_amount) AS total_overdue_amount,

    SUM(outstanding_principal) AS total_outstanding_principal,

    SUM(total_amount_due) AS total_amount_due,

    SUM(total_amount_paid) AS total_amount_paid

FROM FINNOVA_DB.ANALYTICS.VW_LOAN_RISK;