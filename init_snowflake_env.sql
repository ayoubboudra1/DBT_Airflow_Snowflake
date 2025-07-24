USE ROLE ACCOUNTADMIN;

CREATE WAREHOUSE IF NOT EXISTS wh_dbt_airflow_snowflake 
WITH warehouse_size = 'x-small';

USE WAREHOUSE wh_dbt_airflow_snowflake;

CREATE DATABASE IF NOT EXISTS db_dbt_airflow_snowflake;

USE DATABASE db_dbt_airflow_snowflake;

CREATE ROLE IF NOT EXISTS role_dbt_airflow_snowflake;

GRANT USAGE ON WAREHOUSE wh_dbt_airflow_snowflake TO ROLE role_dbt_airflow_snowflake;

GRANT ALL ON DATABASE db_dbt_airflow_snowflake TO ROLE role_dbt_airflow_snowflake;

SHOW GRANTS ON WAREHOUSE wh_dbt_airflow_snowflake;

SHOW GRANTS ON DATABASE db_dbt_airflow_snowflake;

GRANT ROLE role_dbt_airflow_snowflake TO USER ayoubboudra1;

USE ROLE role_dbt_airflow_snowflake;

CREATE SCHEMA dbt_airflow_snowflake_schema;

SHOW SCHEMAS





-- DROP DATABASE IF EXISTS db_dbt_airflow_snowflake;

-- DROP WAREHOUSE IF EXISTS wh_dbt_airflow_snowflake;

-- DROP ROLE IF EXISTS role_dbt_airflow_snowflake;








