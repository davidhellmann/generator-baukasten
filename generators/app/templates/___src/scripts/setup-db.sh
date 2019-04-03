#!/bin/bash
mysql -u<%= dbUser %> -p<%= dbPassword %> -e 'CREATE DATABASE IF NOT EXISTS <%= dbName %>'
gunzip < ../___src/_imports/craft3.sql.gz | mysql -u<%= dbUser %> -p<%= dbPassword %> <%= dbName %>
