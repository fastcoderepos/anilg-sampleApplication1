#!/bin/bash
set -e

POSTGRES="psql --username postgres"

echo "Creating database: dvdrental"

$POSTGRES <<EOSQL
CREATE DATABASE dvdrental OWNER postgres;
EOSQL

echo "Creating dvdrental tables..."
psql -d dvdrental -a -U postgres -f /dvdrental.sql