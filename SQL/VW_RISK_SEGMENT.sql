create or replace view VW_RISK_SEGMENT(
	RISK_GRADE,
	TOTAL_LOANS,
	TOTAL_DISBURSED_AMOUNT,
	AVERAGE_CREDIT_SCORE,
	AVERAGE_DTI,
	DEFAULTED_LOANS,
	DEFAULT_RATE,
	TOTAL_OVERDUE_AMOUNT,
	OUTSTANDING_PRINCIPAL
) as

SELECT
    risk_grade,
    COUNT(*) AS total_loans,
    SUM(disbursement_amount) AS total_disbursed_amount,
    AVG(credit_score) AS average_credit_score,
    AVG(debt_to_income) AS average_dti,
    COUNT_IF(default_flag = 1) AS defaulted_loans,
    ROUND(
        COUNT_IF(default_flag = 1) * 100.0
        / NULLIF(COUNT_IF(default_flag IS NOT NULL), 0),
        2
    ) AS default_rate,
    SUM(total_overdue_amount) AS total_overdue_amount,
    SUM(outstanding_principal) AS outstanding_principal

FROM FINNOVA_DB.ANALYTICS.VW_LOAN_RISK

GROUP BY risk_grade
ORDER BY default_rate DESC;