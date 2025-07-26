FROM astrocrpublic.azurecr.io/runtime:3.0-6

RUN python -m venv venv && \
    source venv/bin/activate && \
    pip install --no-cache-dir dbt-snowflake && \
    deactivate
