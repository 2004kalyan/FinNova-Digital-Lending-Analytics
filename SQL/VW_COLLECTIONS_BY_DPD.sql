create or replace view VW_COLLECTIONS_BY_DPD(
	DPD_BUCKET,
	TOTAL_LOANS,
	LOANS_WITH_COLLECTION_ACTIVITY,
	COLLECTION_ACTIONS,
	TOTAL_AMOUNT_COLLECTED
) as

WITH latest_dpd AS (

    SELECT
        loan_id,
        dpd_bucket

    FROM FINNOVA_DB.RAW.REPAYMENTS

    QUALIFY ROW_NUMBER() OVER (
        PARTITION BY loan_id
        ORDER BY due_date DESC
    ) = 1
),

collection_summary AS (

    SELECT
        loan_id,
        COUNT(*) AS collection_actions,
        SUM(amount_collected) AS amount_collected

    FROM FINNOVA_DB.RAW.COLLECTIONS

    GROUP BY loan_id
)

SELECT
    d.dpd_bucket,

    COUNT(*) AS total_loans,

    COUNT_IF(c.loan_id IS NOT NULL)
        AS loans_with_collection_activity,

    COALESCE(SUM(c.collection_actions), 0)
        AS collection_actions,

    COALESCE(SUM(c.amount_collected), 0)
        AS total_amount_collected

FROM latest_dpd d

LEFT JOIN collection_summary c
    ON d.loan_id = c.loan_id

GROUP BY
    d.dpd_bucket

ORDER BY
    CASE d.dpd_bucket
        WHEN 'Current' THEN 1
        WHEN '1-30' THEN 2
        WHEN '31-60' THEN 3
        WHEN '61-89' THEN 4
        WHEN '90+' THEN 5
        ELSE 6
    END;