#!/usr/bin/env bash

##### instal nginx dan php5 #####
apt-get update
apt-get install -y nginx
apt-get install -y php5 php5-fpm php5-cgi
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi

##### konfigurasi nginx #####
touch /etc/nginx/sites-available/def-8000
cat >> /etc/nginx/sites-available/def-8000 << 'EOF'
# tambahkan ip dari host yang menjadi worker dari load balancer
upstream worker{
	server 192.168.0.3;
	server 192.168.0.4;
}
# konfigurasi server
server {
	#konfigurasi menggunakan port 8000
	listen   8000; ## listen for ipv4; this line is default and implied
	listen   [::]:8000 default ipv6only=on; ## listen for ipv6

	#root /usr/share/nginx/www;
	#index index.php index.htm;

	# Make site accessible from http://localhost/
	server_name localhost;

	location / {
		# First attempt to serve request as file, then
		# as directory, then fall back to index.html

		# tambahkan command untuk menjalankan load balancing
		proxy_pass http://worker;

		#try_files $uri $uri/ /index.html;
		# Uncomment to enable naxsi on this location
		# include /etc/nginx/naxsi.rules
	}
	# konfigurasi PHP-fpm 
	#location ~ \.php$ {
	#	try_files $uri =404;
	#	fastcgi_split_path_info ^(.+\.php)(/.+)$;
	#	# NOTE: You should have "cgi.fix_pathinfo = 0;" in php.ini

		# With php5-cgi alone:
		#fastcgi_pass 127.0.0.1:9000;

		# With php5-fpm:
	#	fastcgi_pass unix:/var/run/php5-fpm.sock;
	#	fastcgi_index index.php;
	#	fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
	#	include fastcgi_params;
	#}
}
EOF

ln -fs /etc/nginx/sites-available/def-8000 /etc/nginx/sites-enabled

cd /var/www/web

sed -f "listen = /var/run/php5-fpm.sock" www.conf
sed -i "s/;listen.owner = www-data/listen.owner = www-data/g" www.conf
sed -i "s/;listen.group = www-data/listen.group = www-data/g" www.conf

service nginx restart
service php5-fpm restart

# buat file index.php untuk uji coba php pada nginx
cat >> /usr/share/nginx/www/index.php << 'EOF'
<?php
echo "Hello from 192.168.0.2";
phpinfo();
?>
EOF
