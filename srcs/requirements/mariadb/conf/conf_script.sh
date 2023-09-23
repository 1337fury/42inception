#!/bin/bash

sed -i 's/bind-address\s*=\s*127\.0\.0\.1/bind-address            = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

sed -i 's/user\s*=\s*mysql/user                    = root/' /etc/mysql/mariadb.conf.d/50-server.cnf