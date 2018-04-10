#!/usr/bin/env bash

apt-get update
apt-get install -y apache2
service apache2 start
cd /etc/apache2/sites-available/
sed -i "s/DocumentRoot\ \/var\/www/DocumentRoot\ \/var\/www\/html/g" default

mkdir /var/www/html
touch /var/www/html/index.html
cat >> /var/www/html/index.html << 'EOF'
test worker 2
EOF

service apache2 restart
