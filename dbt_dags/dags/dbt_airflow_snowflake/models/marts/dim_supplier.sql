SELECT
         suppliers.S_SUPPKEY AS SUPPLIER_KEY,
         suppliers.S_NAME AS NAME,
         suppliers.S_ADDRESS AS ADDRESS,
         suppliers.S_NATIONKEY AS NATION_KEY,
         suppliers.S_PHONE AS PHONE,
         suppliers.S_ACCTBAL AS ACCOUNT_BALANCE,
         suppliers.S_COMMENT AS COMMENT
FROM {{ source('stagging_source', 'supplier') }} AS suppliers
