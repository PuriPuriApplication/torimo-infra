#!/bin/bash
# $1: user
# $2: password
# $3: host
# $4: database
# bash execute_ddl.sh user password host database

for file in $(ls sql_files); do
  mysql -u $1 -p$2 -h $3 -D $4 < $PWD/sql_files/$file
done

