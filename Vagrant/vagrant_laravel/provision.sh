#!/usr/bin/env bash

apt-get update

# install nginx
apt-get install -y nginx

# install php 7.0
# laravel require php 5.5++
apt-get install -y python-software-properties software-properties-common
LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
apt-get update
apt-get install -y php7.1 php7.1-xml php7.1-mbstring php7.1-mysql php7.1-json php7.1-curl php7.1-cli php7.1-common php7.1-mcrypt php7.1-gd libapache2-mod-php7.1 php7.1-zip

# install git (sunnah sih)
apt-get install -y git

# install mysql
export DEBIAN_FRONTEND=noninteractive
apt-get install -y mysql-server

# install composer
apt-get install -y curl
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

