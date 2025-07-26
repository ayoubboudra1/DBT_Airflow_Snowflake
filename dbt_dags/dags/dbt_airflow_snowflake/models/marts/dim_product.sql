SELECT
         products.P_PARTKEY AS PRODUCT_KEY,
         products.P_NAME AS NAME,
         products.P_MFGR AS MANUFACTURER,
         products.P_BRAND AS BRAND,
         products.P_TYPE AS TYPE,
         products.P_SIZE AS SIZE,
         products.P_CONTAINER AS CONTAINER,
         products.P_RETAILPRICE AS RETAIL_PRICE,
         products.P_COMMENT AS COMMENT
FROM {{ source('stagging_source', 'part') }} AS products
