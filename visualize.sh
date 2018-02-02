#!/usr/bin/env bash

if [ "$#" -lt 2 ]
	then
		username=postgres
	else
		username=$2
fi

if [ "$#" -lt 1 ]
  then
    echo "You must specify a database name"
  else
    output_directory=$1

    java -jar schemaSpy_5.0.0.jar \
         -dp postgresql-9.4.1212.jar \
         -t pgsql \
         -u $username \
         -db $1 \
         -host localhost:5432 \
         -s public \
         -o $output_directory

     dot -Tpng $output_directory/diagrams/summary/relationships.real.large.dot > relationships.png
fi
