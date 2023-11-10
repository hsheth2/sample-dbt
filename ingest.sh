#!/bin/bash

set -exo pipefail

datahub=../datahub/metadata-ingestion/venv/bin/datahub

# Parse arguments
while [[ $# -gt 0 ]]
do
    key="$1"

    case $key in
        --postgres)
        POSTGRES=true
        shift
        ;;
        --dbt)
        DBT=true
        shift
        ;;
        *)
        echo "Unknown option $key"
        exit 1
        ;;
    esac
done

# If --postgres or --dbt, skip the other one.
if [ "$POSTGRES" = true ]; then
    echo "Postgres ingest"
    $datahub ingest --no-spinner -c postgres.yml
    $datahub ingest mcps postgres-sample-output.json
elif [ "$DBT" = true ]; then
    echo "DBT ingest"
    DBT_PROJECT_ROOT=$(pwd) $datahub ingest --no-spinner -c dbt_to_console.yml
    $datahub ingest mcps dbt-sample-output.json
else
    echo "No ingest option specified"
    exit 1
fi
