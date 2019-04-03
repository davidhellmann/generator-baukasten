#!/bin/bash
mysql -u<%= dbUser %> -p<%= dbPassword %> -e 'CREATE DATABASE IF NOT EXISTS <%= dbName %>'
mysql -u<%= dbUser %> -p<%= dbPassword %> <%= dbName %> < ../___src/_imports/craft3.sql.gz
