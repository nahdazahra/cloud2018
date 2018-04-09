# Vagrant
![Image of Yaktocat](https://camo.githubusercontent.com/22b937f354705f272f69fc08f8bac8e05d09fbf2/68747470733a2f2f626c6f672e7468656f646f2e66722f77702d636f6e74656e742f75706c6f6164732f323031372f30372f56616772616e742e706e67)

## Soal dan Penyelesaian
1. Buat vagrant virtualbox dan buat user 'awan' dengan password 'buayakecil'.

      [Penyelesaian](https://github.com/nahdazahra/cloud2018/blob/master/Vagrant/soal-1.md)

2. Buat vagrant virtualbox dan lakukan provisioning install Phoenix Web Framework
      
      [Penyelesaian](https://github.com/nahdazahra/cloud2018/blob/master/Vagrant/soal-2.md)

3. Buat vagrant virtualbox dan lakukan provisioning install:

    * php
    * mysql
    * composer
    * nginx

    Setelah melakukan provisioning, clone https://github.com/fathoniadi/pelatihan-laravel.git pada folder yang sama dengan vagrantfile di komputer host. Setelah itu sinkronisasi folder pelatihan-laravel host ke vagrant ke /var/www/web dan jangan lupa install vendor laravel agar dapat dijalankan. Setelah itu setting root document nginx ke /var/www/web. webserver VM harus dapat diakses pada port 8080 komputer host dan mysql pada vm dapat diakses pada port 6969 komputer host.
    
      [Penyelesaian](https://github.com/nahdazahra/cloud2018/blob/master/Vagrant/soal-3.md)

4. Buat vagrant virtualbox dan lakukan provisioning install:

    * Squid proxy
    * Bind9
    
    [Penyelesaian](https://github.com/nahdazahra/cloud2018/blob/master/Vagrant/soal-4.md)
    
