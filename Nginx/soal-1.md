## Dokumentasi Soal 1
# Membuat Sistem Load Balancing dengan Provisioning

## Soal

```
Buatlah sistem load balancing dengan 1 load balancer(nginx) dan 2 worker (apache2), terapkan algoritma load balancing round-robin, least-connected, dan ip-hash.
Buatlah Vagrantfile sekaligus provisioning-nya untuk menyelesaikan kasus.
```

## Penyelesaian
Kasus tersebut dapat diselesaikan dengan membuat 3 buah virtualisasi menggunakan vagrant. OS yang akan digunakan pada masing-masing vm adalah Ubuntu (12.04) Precise 64 bit.
Download **Vagrant Box** dengan menjalankan
```
vagrant box add hashicorp/precise64
```
Setelah itu, buat folder untuk masing-masing vm dan inisialisasi vm pada masing-masing folder.
```
mkdir load-balancer host1 host2
vagrant init
```
Edit Vagrantfile pada masing-masing folder dengan set-up berikut.
#### Set Box
```
config.vm.box = "hashicorp/precise64"
```

#### Set Provision
```
config.vm.provision "shell", path: "bootstrap.sh"
```

#### Set IP Local Load Balancer
```
config.vm.network "private_network", ip: "192.168.0.2"
```

#### Set IP Local Worker 1
```
config.vm.network "private_network", ip: "192.168.0.3"
```

#### Set IP Local Worker 2
```
config.vm.network "private_network", ip: "192.168.0.4"
```
Simpan Vagrantfile masing-masing virtualisasi.

### **VM Load Balancer**
1. Membuat bash script dengan nama **bootstrap.sh** pada folder yang sama dengan **Vagrantfile**

    ```bash
    nano bootstrap.sh
    ```

2. Menuliskan script berikut
    #### Install NGINX dan PHP 5
    ```bash
    apt-get update
    apt-get install -y nginx
    apt-get install -y php5 php5-fpm php5-cgi
    if ! [ -L /var/www ]; then
        rm -rf /var/www
        ln -fs /vagrant /var/www
    fi
    ```
    #### Konfigurasi NGINX sebagai Load Balancer
    Pada NGINX, secara default akan menjalankan algoritma round-robin. Maka tidak perlu menambahkan nama algoritma `round-robin` pada definisi array IP worker.
    ```bash
    touch /etc/nginx/sites-available/def-8000
    cat >> /etc/nginx/sites-available/def-8000 << 'EOF'
    # array ip host yang menjadi worker dari load balancer
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
    }
    EOF
    ```
    #### Mengaktifkan Konfigurasi Load Balancer
    Berbeda dengan apache2 dimana untuk mengaktifkan web server hanya dengan menjalankan `a2ensite [nama file konfigurasi]`, pada nginx dibutuhkan symbolic link agar konfigurasi yang dijalankan sesuai dengan konfigurasi terbaru.
    ```bash
    ln -fs /etc/nginx/sites-available/def-8000 /etc/nginx/sites-enabled
    ```
    #### Restart NGINX
    ```bash
    service nginx restart
    ```
    Untuk menjalankan algoritma **least connection** atau **ip-hash** pada load balancer, tambahkan script `least_conn;` atau `ip_hash;` pada array.
    Misal akan menjalankan algoritma ip-hash, maka ubah script menjadi
    ```bash
    upstream worker{
        ip_hash;
        server 192.168.0.3;
        server 192.168.0.4;
    }
    ```
Simpan file **bootstrap.sh**, vagrant akan menjalankan provision sesuai dengan command yang ada script tersebut.

### **VM Worker 1 dan 2**
1. Membuat bash script dengan nama **bootstrap.sh** pada folder yang sama dengan **Vagrantfile**

    ```bash
    nano bootstrap.sh
    ```

2. Menuliskan script berikut
    #### Install apache2
    ```bash
    apt-get update
    apt-get install -y apache2
    service apache2 start
    ```
    #### Edit Konfigurasi DocumentRoot pada Web Server
    ```bash
    cd /etc/apache2/sites-available/
    sed -i "s/DocumentRoot \/var\/www/DocumentRoot \/var\/www\/html/g" default
    ```
    #### Buat File untuk Uji Coba Web Server
    Pada worker 1, buat file **index.html** dengan script `test worker 1` dengan menambahkan script berikut
    ```bash
    mkdir /var/www/html
    touch /var/www/html/index.html
    cat >> /var/www/html/index.html << 'EOF'
    test worker 1
    EOF
    ```
    Lakukan hal yang sama untuk membuat file **index.html** dengan script `test worker 2` pada worker 2.
    #### Restart Apache2
    ```bash
    service apache2 restart
    ```

## Script

[Vagrant Load Balancer](https://github.com/nahdazahra/cloud2018/tree/master/Nginx/vagrant_load_balancing)