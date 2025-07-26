{% macro discount_amount(price, discount) %}
    ({{ price }} * {{ discount }})::numeric(16, 2)
{% endmacro %}

{% macro delivery_days(receipt_date_col, order_date_col) %}
    ({{ receipt_date_col }} - {{ order_date_col }})::integer
{% endmacro %}