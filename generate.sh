#!/bin/bash

set -euo pipefail

# execute transforms
dbt run --profiles-dir .

# generate ./target/sources.json
dbt source snapshot-freshness

# generate ./target/catalog.json and ./target/manifest.json
dbt docs generate

# Run post-processing (minimizes git diffs)
python process_generated.py
