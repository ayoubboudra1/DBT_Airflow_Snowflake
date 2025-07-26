
import os 
from datetime import datetime 
from pathlib import Path 

from cosmos import DbtDag, ProjectConfig, ProfileConfig 
from cosmos.profiles import PostgresUserPasswordProfileMapping 

DEFAULT_DBT_ROOT_PATH = Path(__file__).parent / "dbt_airflow_snowflake" 
DBT_ROOT_PATH = Path(os.getenv("DBT_ROOT_PATH", DEFAULT_DBT_ROOT_PATH)) 

profile_config = ProfileConfig( 
    profile_name="default", 
    target_name="dev", 
    profile_mapping=PostgresUserPasswordProfileMapping( 
        conn_id="airflow_db", 
        profile_args={"schema": "public"}, 
    ), 
) 

# [START local_example] 
basic_cosmos_dag = DbtDag( 
    # dbt/cosmos-specific parameters 
    project_config=ProjectConfig( 
        DBT_ROOT_PATH / "dbt_airflow_snowflake", 
    ), 
    profile_config=profile_config, 
    operator_args={ 
        "install_deps": True,  # install any necessary dependencies before running any dbt command 
        "full_refresh": True,  # used only in dbt commands that support this flag 
    }, 
    # normal dag parameters 
    schedule_interval="0 5 * * *",  # run every day at the 5th minute
    start_date=datetime(2023, 1, 1), 
    catchup=False, 
    dag_id="basic_cosmos_dag", 
    default_args={"retries": 2}, 
) 
# [END local_example] 