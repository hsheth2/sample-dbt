#!/bin/bash

set -euo pipefail

rm -rf target

# generate ./target/sources.json
dbt source snapshot-freshness

# generate ./target/catalog.json
dbt docs generate

# build
dbt build --profiles-dir .

# minimize git diff
python process_generated.py
