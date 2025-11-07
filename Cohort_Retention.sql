WITH cohort_orders AS(
    SELECT
        CustomerID,
        MIN(OrderDate) OVER (PARTITION BY CustomerID) AS first_order_date,
        OrderDate
    FROM RetailOrders
)
, cohort_raw AS(
SELECT
    CustomerID,
    FORMAT(first_order_date, 'yyyy-MM') AS cohort_month,
    FORMAT(OrderDate, 'yyyy-MM') AS order_month,
    DATEDIFF(
        MONTH, 
        DATEFROMPARTS(YEAR(first_order_date), MONTH(first_order_date), 1),
        DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1)
    ) AS cohort_index
FROM cohort_orders
)
, cohort_size AS(
SELECT
	cohort_month,
    COUNT(DISTINCT CustomerID) AS user_first_month
FROM cohort_raw
Where cohort_index = 0
GROUP BY cohort_month
)
, customer_count_by_cohort_index AS(
SELECT
	cohort_month,
    cohort_index,
    COUNT(DISTINCT CustomerID) AS customers_count
FROM cohort_raw
GROUP BY cohort_month, cohort_index
)
, retention_rate AS(
SELECT
	cci.cohort_month,
	cci.cohort_index,
	cci.customers_count,
	cs.user_first_month,
	CAST(cci.customers_count * 1.0 / cs.user_first_month as DECIMAL(10, 2)) as retention_rate
FROM customer_count_by_cohort_index cci
JOIN cohort_size cs
	ON cci.cohort_month = cs.cohort_month
)
SELECT
	cohort_month,
	[RR0], [RR1], [RR2], [RR3], [RR4], [RR5], [RR6], [RR7], [RR8], [RR9], [RR10], [RR11], [RR12] 
FROM(
	SELECT
		cohort_month,
		'RR' + CAST(cohort_index AS VARCHAR) AS RR_Column,
		retention_rate
	FROM retention_rate
) rr
PIVOT(
	SUM(retention_rate)
	FOR RR_Column IN([RR0], [RR1], [RR2], [RR3], [RR4], [RR5], [RR6], [RR7], [RR8], [RR9], [RR10], [RR11], [RR12])
) pv
