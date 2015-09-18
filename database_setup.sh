#!/bin/bash

#Run this script to setup the database. This should be hooked up with
#the git pull command to create consistency for the database among the
#different development environments. However this can only be done on
#a per-environment basis.

function outputComment {
	outputPoundLine
	echo $1
	outputPoundLine
}

function outputPoundLine {
	echo "####################################"
}

echo "Initializing database..."
mysql.server start
mysql -u root -p -e "
DROP DATABASE IF EXISTS hobby_site_development;
CREATE DATABASE hobby_site_development;
GRANT ALL PRIVILEGES ON hobby_site_development.*
TO 'hobby_site'@'localhost'
IDENTIFIED BY 'password';
exit"

outputComment "Dropping and recreating the database"
rake db:schema:load

outputComment "Seeding default data..."
rake db:seed
