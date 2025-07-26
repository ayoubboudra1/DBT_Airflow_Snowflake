SELECT 
            nation.N_NATIONKEY AS NATION_KEY,
            nation.N_NAME AS NAME,
            nation.N_REGIONKEY AS REGION_KEY,
            region.R_NAME AS REGION_NAME,
            nation.N_COMMENT AS COMMENT,
            region.R_COMMENT AS REGION_COMMENT
FROM {{source('stagging_source', 'nation') }} AS nation
LEFT JOIN {{ source('stagging_source', 'region') }} AS region
ON nation.N_REGIONKEY = region.R_REGIONKEY