## Dokumentasi Tugas 3
# Provisioning Install PHP, MySQL, Composer, dan Nginx di Vagrant Virtualbox 

## Soal
Buat vagrant virtualbox dan lakukan provisioning install:

* php 
* mysql
* composer
* nginx

Setelah melakukan provisioning, clone https://github.com/fathoniadi/pelatihan-laravel.git pada folder yang sama dengan vagrantfile di komputer host. Setelah itu sinkronisasi folder pelatihan-laravel host ke vagrant ke /var/www/web dan jangan lupa install vendor laravel agar dapat dijalankan. Setelah itu setting root document nginx ke /var/www/web. webserver VM harus dapat diakses pada port 8080 komputer host dan mysql pada vm dapat diakses pada port 6969 komputer host.

## Penyelesaian
### **Langkah 1**
Membuat sebuah vagrant virtualbox dengan langkah-langkah dan konfigurasi yang telah diajarkan pada [Modul 1 Cloud 2018](https://github.com/fathoniadi/cloud-2018/tree/master/vagrant "Modul 1 Cloud 2018")

### **Langkah 2**
Membuat bash script dengan nama **provisioning.sh** pada folder yang sama dengan **Vagrantfile**
```bash
nano provisioning.sh
```
dengan isi :
```
#!/usr/bin/env bash

apt-get update
apt-get install -y nginx
apt-get install -y php5 php5-cgi php5-fpm php5-cli php5-mcrypt
apt-get install -y git

export DEBIAN_FRONTEND=noninteractive
apt-get install -y mysql-server

apt-get install -y curl
#curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/loc$
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

```
kemudian simpan file.


## Kendala
Ada beberapa kendala yang kami hadapi:

1. Laravel membutuhkan php 5.5++, sedangkan **box hashicorp/precise64** menggunakan Ubuntu 12.04 dimana hanya mampu diinstall php5, tidak bisa lebih. Sudah berbagai cara kami lakukan, diantaranya ```wget```, ```add repo```, hingga akhirnya kami memutuskan untuk memakai box yang ber-Ubuntu 16.04 saja.

## Script
[Vagrant Laravel](https://github.com/nahdazahra/cloud2018/tree/master/Modul1_Vagrant/vagrant_laravel "Vagrant Laravel")

