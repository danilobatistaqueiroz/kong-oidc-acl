#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER simha;
    ALTER USER simha WITH PASSWORD 'simha';
    CREATE DATABASE btgapp;
    GRANT ALL PRIVILEGES ON DATABASE btgapp TO simha;
EOSQL