#!/bin/bash
trap "exit" SIGINT
echo Configured to generate new fortune every $INTERVAL seconds
mkdir -p /var/htdocs
while :
do
  echo $(date) Writing fortune to /var/htdocs/index.html
  /usr/games/fortune > /var/htdocs/index.html
  sleep $INTERVAL
done

# In development environment, $INTERNAL=10
# In production environment, $INTERNAL=25

# $DB_ENDPOINT
# $DB_USERNAME
# $DB_PASSWORD
# In development environment, $DB_ENDPOINT=dev.db.com, $DB_USERNAME=dev-user, $DB_PASSWORD=redhat123
# In production environment, $DB_ENDPOINT=prod.db.com, $DB_USERNAME=prod-user, $DB_PASSWORD=234578dglkah