#!/bin/bash

set -euxo pipefail

rm -rf target

# generate ./target/sources.json
dbt source snapshot-freshness

# build
dbt build --profiles-dir .
cp target/run_results.json target/run_results.json.bak

# generate ./target/catalog.json
dbt docs generate

# restore run_results.json
mv target/run_results.json.bak target/run_results.json

# minimize git diff
python process_generated.py
