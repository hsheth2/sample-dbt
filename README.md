# sample-dbt

A starter for setting up dbt test cases.

Requirements:

- Docker
- dbt
- Python

## Getting started

Unless otherwise specified, run all commands from the repo root.

1. Set up Postgres and populate the [pagila](https://github.com/devrimgunduz/pagila) sample database.

   ```shell
   ./setup-postgres.sh
   ```

2. Set up dbt (order matters!):

   ```shell
   # create ~/.dbt directory to copy profiles.yml
   mkdir ~/.dbt
   # copy profiles.yml to ~/.dbt/
   cp profiles.yml ~/.dbt/
   ```

3. Generate files for dbt:

   ```shell
   ./generate.sh
   ```
