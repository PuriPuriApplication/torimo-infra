#!/bin/bash
# $1: user
# $2: password
# $3: host
# $4: database
# bash execute_ddl.sh user password host database

. ./.env

if [ $1 = "local" ]; then
  echo "if"
  DB_USER=torimo
  DB_PASSWORD=torimo
  DB_URL=127.0.0.1
  DB_PORT=3306
  DB_NAME=torimo
fi

for file in $(ls sql_files); do
  mysql -u${DB_USER} -p${DB_PASSWORD} -h${DB_URL} -D${DB_NAME} -P${DB_PORT} < $PWD/sql_files/$file
done
