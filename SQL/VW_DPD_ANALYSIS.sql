create or replace view VW_DPD_ANALYSIS(
	LATEST_DPD_BUCKET,
	TOTAL_LOANS,
	TOTAL_DISBURSED_AMOUNT,
	TOTAL_OVERDUE_AMOUNT,
	OUTSTANDING_PRINCIPAL,
	DEFAULTED_LOANS
) as

SELECT
    latest_dpd_bucket,
    COUNT(*) AS total_loans,
    SUM(disbursement_amount) AS total_disbursed_amount,
    SUM(total_overdue_amount) AS total_overdue_amount,
    SUM(outstanding_principal) AS outstanding_principal,
    COUNT_IF(default_flag = 1) AS defaulted_loans

FROM FINNOVA_DB.ANALYTICS.VW_LOAN_RISK

WHERE latest_dpd_bucket IS NOT NULL

GROUP BY latest_dpd_bucket

ORDER BY
    CASE latest_dpd_bucket
        WHEN 'Current' THEN 1
        WHEN '1-30' THEN 2
        WHEN '31-60' THEN 3
        WHEN '61-89' THEN 4
        WHEN '90+' THEN 5
        ELSE 6
    END;