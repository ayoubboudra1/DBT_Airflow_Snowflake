SELECT orderd.O_TOTALPRICE AS order_total_price,
       orderd.O_ORDERDATE AS order_date,
       customer.C_NAME AS customer_name,
       customer.C_ADDRESS AS customer_address,
FROM {{ source('stagging_source', 'orderd') }} AS orderd
LEFT JOIN {{ source('stagging_source', 'customer') }} AS customer
ON customer.C_CUSTKEY = orderd.O_CUSTKEY
