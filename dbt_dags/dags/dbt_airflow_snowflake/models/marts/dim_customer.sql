SELECT
         customers.C_CUSTKEY AS CUSTOMER_KEY,
         customers.C_NAME AS NAME,
         customers.C_ADDRESS AS ADDRESS,
         customers.C_NATIONKEY AS NATION_KEY,
         customers.C_PHONE AS PHONE,
         customers.C_ACCTBAL AS ACCOUNT_BALANCE,
         customers.C_MKTSEGMENT AS MARKET_SEGMENT,
         customers.C_COMMENT AS COMMENT
FROM {{ source('stagging_source', 'customer') }} AS customers
