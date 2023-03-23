# sample-dbt

A starter for setting up dbt test cases.

Requirements:

- Docker
- dbt
- Python

## Getting started

Unless otherwise specified, run all commands from the repo root.

1. Set up Postgres. We use the [pagila](https://github.com/devrimgunduz/pagila) database.

   ```shell
   docker pull postgres

   # start (add -d before the last 'postgres' to run in background)
   docker run --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=secret -d postgres
   ```

2. Ingest sample data into the database

   ```shell
   # create database
   echo 'CREATE DATABASE pagila' | docker exec -i postgres psql -U postgres
   # schema objects
   cat ./db/pagila-schema.sql | docker exec -i postgres psql -U postgres -d pagila
   # data
   cat ./db/pagila-data.sql | docker exec -i postgres psql -U postgres -d pagila
   ```

   To confirm ingestion, enter psql shell again (using `docker exec -it postgres psql -U postgres -d pagila`) and run

   ```sql
   # list tables
   \dt
   ```

3. Set up dbt (order matters!):

   ```shell
   # create ~/.dbt directory to copy profiles.yml 
   mkdir ~/.dbt
   # copy profiles.yml to ~/.dbt/
   cp profiles.yml ~/.dbt/
   ```

4. Generate files for dbt:

   ```shell
   ./generate.sh
   ```
