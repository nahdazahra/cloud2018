## Dokumentasi Soal 3
# Provisioning Install PHP, MySQL, Composer, dan Nginx di Vagrant Virtualbox 

## Soal
Buat vagrant virtualbox dan lakukan provisioning install:

* php 
* mysql
* composer
* nginx

Setelah melakukan provisioning, clone https://github.com/fathoniadi/pelatihan-laravel.git pada folder yang sama dengan vagrantfile di komputer host. Setelah itu sinkronisasi folder pelatihan-laravel host ke vagrant ke /var/www/web dan jangan lupa install vendor laravel agar dapat dijalankan. Setelah itu setting root document nginx ke /var/www/web. webserver VM harus dapat diakses pada port 8080 komputer host dan mysql pada vm dapat diakses pada port 6969 komputer host.

## Penyelesaian
### **Langkah 1** - Membuat Vagrant Virtual Box dan konfigurasinya
Membuat sebuah vagrant virtualbox dengan langkah-langkah dan konfigurasi yang telah diajarkan pada [Modul 1 Komputasi Awan 2018](https://github.com/fathoniadi/cloud-2018/tree/master/vagrant "Modul 1 Komputasi Awan 2018"), dengan pengecualian:

1. Vagrant Box **hashicorp/precise64** yang menggunakan OS Ubuntu 12.04 diganti menjadi Vagrant Box **bento/ubuntu-16.04** yang menggunakan OS Ubuntu 16.04. Mendownload Vagrant Box **bento/ubuntu-16.04**
    
    ```bash
    vagrant box add bento/ubuntu-16.04
    ```
2. Mengedit **Vagrantfile**

    ```bash
    config.vm.box = "bento/ubuntu-16.04"
    ```
Selebihnya, konfigurasinya sama

### **Langkah 2** - Membuat Provision Script
1. Membuat bash script dengan nama **provision.sh** pada folder yang sama dengan **Vagrantfile**

    ```bash
    nano provision.sh
    ```
2. Menuliskan script berikut

    ```bash
    #!/usr/bin/env bash

    apt-get update

    # install nginx 
    apt-get install -y nginx

    # install php 7.0
    # laravel require php 5.5++
    apt-get install -y python-software-properties software-properties-common
    LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
    apt-get update
    apt-get install -y php7.0 php7.0-fpm php7.0-cli php7.0-cgi php7.0-mysql php7.0-m$

    # install git (sunnah sih)
    apt-get install -y git

    # install mysql       
    export DEBIAN_FRONTEND=noninteractive
    apt-get install -y mysql-server

    # install composer
    apt-get install -y curl
    curl -sS https://getcomposer.org/installer | php
    mv composer.phar /usr/local/bin/composer

    # install vendor laravel
    composer global require "laravel/installer"
    ```

    Keterangan:

    * ```export DEBIAN_FRONTEND=noninteractive``` fungsinya untuk melewati langkah-langkah konfigurasi saat penginstalan. Contohnya penginstalan pada mysql yang meminta masukan user, password, dsb 

3. Menyimpan file **provision.sh**

### **Langkah 3** - Mengedit Vagrantfile
1. Membuka **Vagrantfile**

    ```bash
    nano Vagrantfile
    ```
2. Menambahkan baris berikut 

    ```bash
        config.vm.provision "shell", path: "provision.sh"
    ```
    diatas ```end``` paling terakhir, sehingga menjadi 
    
    ```bash
        config.vm.provision "shell", path: "provision.sh"
    end
    ```
3. Menyimpan **Vagrantfile**

### **Langkah 4** - Reload Virtualisasi untuk menjalankan provisioning
1. Jika vagrant telah dinyalakan, lakukan 

    ```bash
    vagrant reload --provision
    ```
2. Namun jika vagrant belum dinyalakan, maka lakukan 

    ```bash
    vagrant up --provision
    ```
Maka, vagrant akan melakukan instalasi sesuai script pada **provision.sh**

### **Langkah 5** - Clone repo pelatihan-laravel

Masuk ke folder yang sama dengan **Vagrantfile** pada terminal, kemudian mengetik
    
```bash
git clone https://github.com/fathoniadi/pelatihan-laravel
```
Maka, repo **pelatihan-laravel** akan ter-clone dalam folder **pelatihan-laravel** 

### **Langkah 6** - Sinkronisasi folder 
1. Membuka **Vagrantfile**

    ```bash
    nano Vagrantfile
    ```
2. Meng-uncomment baris berikut 

    ```bash
    # config.vm.synced_folder "../data", "/vagrant_data"
    ```
    dan menggantinya menjadi 
    
    ```bash
    config.vm.synced_folder "pelatihan-laravel/", "/var/www/web"
    ```
    **pelatihan-laravel/** adalah folder dari repo laravel yang telah di-clone sebelumnya, sedangkan **/var/www/web** adalah folder yang ingin di-sinkronisasikan dalam virtualisasi vagrant

3. Menyimpan **Vagrantfile**

4. Melakukan
    
    ```bash
    vagrant reload --provision
    ```
### **Langkah 7** - Setting root document Nginx 


## Kendala
Ada beberapa kendala yang kami hadapi:

1. Laravel membutuhkan php 5.5++, sedangkan Vagrant Box **hashicorp/precise64** menggunakan OS Ubuntu 12.04 dimana hanya mampu diinstall php5 (tidak bisa versi di atasnya). Sudah berbagai cara kami coba, termasuk ```wget```dan ```add repo```, hingga akhirnya kami memutuskan untuk memakai Vagrant Box yang menggunakan OS Ubuntu 16.04 saja.

## Script
[Vagrant Laravel](https://github.com/nahdazahra/cloud2018/tree/master/Modul1_Vagrant/vagrant_laravel "Vagrant Laravel")

