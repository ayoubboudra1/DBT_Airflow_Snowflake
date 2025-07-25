SELECT
    sales.L_ORDERKEY AS order_key,
    sales.L_LINENUMBER AS lineitem_key,
    orders.O_CUSTKEY AS customer_key,
    sales.L_PARTKEY AS product_key,
    sales.L_SUPPKEY AS supplier_key,
    orders.O_ORDERDATE AS order_date,
    sales.L_SHIPDATE AS ship_date,
    sales.L_COMMITDATE AS commit_date,
    sales.L_RECEIPTDATE AS receipt_date,
    sales.L_QUANTITY AS quantity,
    sales.L_EXTENDEDPRICE AS extended_price,
    sales.L_DISCOUNT AS discount,
    sales.L_TAX AS tax,
    sales.L_RETURNFLAG AS return_flag,
    sales.L_LINESTATUS AS line_status,
    sales.L_SHIPINSTRUCT AS ship_instruct,
    sales.L_SHIPMODE AS ship_mode,
    sales.L_COMMENT AS comment,
    {{ discount_amount('L_EXTENDEDPRICE', 'L_DISCOUNT') }} AS discount_amount,
    {{ delivery_days('L_RECEIPTDATE', 'O_ORDERDATE') }} AS delivery_days,


FROM {{ source('stagging_source', 'lineitem') }} AS sales
LEFT JOIN {{ source('stagging_source', 'orders') }} AS orders
    ON sales.L_ORDERKEY = orders.O_ORDERKEY
