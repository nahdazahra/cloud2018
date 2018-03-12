# Vagrant
![Image of Yaktocat](https://camo.githubusercontent.com/22b937f354705f272f69fc08f8bac8e05d09fbf2/68747470733a2f2f626c6f672e7468656f646f2e66722f77702d636f6e74656e742f75706c6f6164732f323031372f30372f56616772616e742e706e67)

[Modul 1 Komputasi Awan 2018](https://github.com/fathoniadi/cloud-2018/tree/master/vagrant "Modul 1 Komputasi Awan 2018")

## Tugas
1. Buat vagrant virtualbox dan buat user 'awan' dengan password 'buayakecil'.

      [Dokumentasi Tugas 1](https://github.com/fathoniadi/cloud-2018/tree/master/vagrant "Modul 1 Komputasi Awan 2018")

2. Buat vagrant virtualbox dan lakukan provisioning install Phoenix Web Framework

3. Buat vagrant virtualbox dan lakukan provisioning install:

    * php
    * mysql
    * composer
    * nginx

    setelah melakukan provioning, clone https://github.com/fathoniadi/pelatihan-laravel.git pada folder yang sama dengan vagrantfile di komputer host. Setelah itu sinkronisasi folder pelatihan-laravel host ke vagrant ke /var/www/web dan jangan lupa install vendor laravel agar dapat dijalankan. Setelah itu setting root document nginx ke /var/www/web. webserver VM harus dapat diakses pada port 8080 komputer host dan mysql pada vm dapat diakses pada port 6969 komputer host

4. Buat vagrant virtualbox dan lakukan provisioning install:

    * Squid proxy
    * Bind9
    
