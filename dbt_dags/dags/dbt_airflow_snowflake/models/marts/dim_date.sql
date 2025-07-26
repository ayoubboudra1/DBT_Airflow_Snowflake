WITH all_dates AS (
    SELECT
        my_date_column AS date,
        EXTRACT(DAY FROM my_date_column) AS day,
        EXTRACT(MONTH FROM my_date_column) AS month,
        EXTRACT(YEAR FROM my_date_column) AS year,
        EXTRACT(QUARTER FROM my_date_column) AS quarter,
        CASE 
            WHEN DAYOFWEEK(my_date_column) IN (0, 6) THEN TRUE
            ELSE FALSE
        END AS is_weekend
    FROM (
        SELECT L_SHIPDATE AS my_date_column FROM {{ source('stagging_source', 'lineitem') }}
        UNION ALL
        SELECT L_COMMITDATE AS my_date_column FROM {{ source('stagging_source', 'lineitem') }}
        UNION ALL
        SELECT L_RECEIPTDATE AS my_date_column FROM {{ source('stagging_source', 'lineitem') }}
        UNION ALL
        SELECT O_ORDERDATE AS my_date_column FROM {{ source('stagging_source', 'orders') }}
    )
)
SELECT DISTINCT *
FROM all_dates
WHERE date IS NOT NULL