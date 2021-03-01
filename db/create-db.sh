# /bin/bash

echo "create database pagila;" | psql -U postgres 
cat pagila-schema.sql | psql -U postgres -d pagila
cat pagila-data.sql | psql -U postgres -d pagila