#!/bin/bash

set -euxo pipefail

docker pull postgres

docker run --rm --name postgres -e POSTGRES_PASSWORD=secret -d -p 5432:5432 postgres

# Wait for PostgreSQL to be up and healthy
until docker exec postgres pg_isready -U postgres -h localhost -p 5432; do
    sleep 1
done

# create database
echo 'CREATE DATABASE pagila' | docker exec -i postgres psql -U postgres
# schema objects
cat ./db/pagila-schema.sql | docker exec -i postgres psql -U postgres -d pagila
# data
cat ./db/pagila-data.sql | docker exec -i postgres psql -U postgres -d pagila

# Check by listing tables.
echo '\dt' | docker exec -i postgres psql -U postgres -d pagila
