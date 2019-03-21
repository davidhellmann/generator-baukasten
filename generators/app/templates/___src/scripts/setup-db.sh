#!/bin/bash
mysql -u <%= dbUser %> -p <%= dbPassword %> <%= dbName %> <% if (importDB ) { %>< ___src/_imports/craft3.sql<% } %>


