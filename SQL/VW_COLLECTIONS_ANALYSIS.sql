create or replace view VW_COLLECTIONS_ANALYSIS(
	COLLECTION_ACTION,
	COLLECTION_ACTIONS,
	LOANS_CONTACTED,
	TOTAL_AMOUNT_COLLECTED,
	AVERAGE_AMOUNT_COLLECTED,
	RECOVERED_ACTIONS,
	PARTIAL_ACTIONS
) as

SELECT
    c.collection_action,
    COUNT(*) AS collection_actions,
    COUNT(DISTINCT c.loan_id) AS loans_contacted,
    SUM(c.amount_collected) AS total_amount_collected,
    AVG(c.amount_collected) AS average_amount_collected,
    COUNT_IF(c.recovery_status = 'Recovered') AS recovered_actions,
    COUNT_IF(c.recovery_status = 'Partial') AS partial_actions

FROM FINNOVA_DB.RAW.COLLECTIONS c

GROUP BY
    c.collection_action

ORDER BY
    total_amount_collected DESC;