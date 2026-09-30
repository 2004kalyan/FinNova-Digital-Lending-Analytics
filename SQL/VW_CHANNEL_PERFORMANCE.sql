create or replace view VW_CHANNEL_PERFORMANCE(
	ACQUISITION_CHANNEL,
	TOTAL_LOANS,
	TOTAL_DISBURSED_AMOUNT,
	DEFAULTED_LOANS,
	DEFAULT_RATE,
	TOTAL_OVERDUE_AMOUNT,
	OUTSTANDING_PRINCIPAL
) as

SELECT
    acquisition_channel,
    COUNT(*) AS total_loans,
    SUM(disbursement_amount) AS total_disbursed_amount,
    COUNT_IF(default_flag = 1) AS defaulted_loans,

    ROUND(
        COUNT_IF(default_flag = 1) * 100.0
        / NULLIF(COUNT_IF(default_flag IS NOT NULL), 0),
        2
    ) AS default_rate,

    SUM(total_overdue_amount) AS total_overdue_amount,
    SUM(outstanding_principal) AS outstanding_principal

FROM FINNOVA_DB.ANALYTICS.VW_LOAN_RISK

GROUP BY acquisition_channel
ORDER BY default_rate DESC;