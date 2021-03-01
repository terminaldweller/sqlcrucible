#!/usr/bin/env sh
# psql -h 127.0.0.1 -d devi -U devi -p 9001 -q -a -f ./student.sql
psql -h 127.0.0.1 -d devi -U devi -p 9001 -q -a -f ./company.sql
