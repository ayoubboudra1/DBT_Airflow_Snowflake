SELECT 
         orders.O_ORDERKEY AS ORDER_KEY,
         orders.O_ORDERSTATUS AS ORDER_STATUS,
         orders.O_TOTALPRICE AS TOTAL_PRICE,
         orders.O_ORDERDATE AS ORDER_DATE,
         orders.O_ORDERPRIORITY AS ORDER_PRIORITY,
         orders.O_CLERK AS CLERK,
         orders.O_SHIPPRIORITY AS SHIP_PRIORITY,
         orders.O_COMMENT AS COMMENT
FROM {{ source('stagging_source', 'orders') }} AS orders
