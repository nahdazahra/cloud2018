# Ansible

![Ansible](https://camo.githubusercontent.com/acde01f911359130a3342d06d2483d1439fc420b/68747470733a2f2f75706c6f61642e77696b696d656469612e6f72672f77696b6970656469612f636f6d6d6f6e732f7468756d622f322f32342f416e7369626c655f6c6f676f2e7376672f35303070782d416e7369626c655f6c6f676f2e7376672e706e67)

## Soal 

1. Buat 3 VM, 2 Ubuntu 16.04 sebagai worker, 1 Debian 9 sebagai DB server

2. Pada vm Debian install Mysql dan setup agar koneksi DB bisa diremote dan memiliki user: username: regal password: bolaubi

3. Pada worker:
    * 2.1. Install Nginx 
    * 2.2. Install PHP 7.2
    * 2.3. Install Composer
    * 2.4. Install Git
    
    dan pastikan worker dapat menjalankan Laravel 5.6

4. Clone https://github.com/udinIMM/Hackathon pada setiap worker dan setup database pada .env mengarah ke DB server.
5. Setup root directory nginx ke folder Laravel hasil clone repo diatas

## Penyelesaian

[Sebuah Penyelesaian](https://github.com/nahdazahra/cloud2018/tree/master/Docker/penyelesaian.md)
