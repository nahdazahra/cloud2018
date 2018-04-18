# Docker

![Docker](https://camo.githubusercontent.com/441e1279747bdb4c1a11144f800d8fb8aae98026/68747470733a2f2f75706c6f61642e77696b696d656469612e6f72672f77696b6970656469612f636f6d6d6f6e732f7468756d622f342f34652f446f636b65725f253238636f6e7461696e65725f656e67696e652532395f6c6f676f2e7376672f35303070782d446f636b65725f253238636f6e7461696e65725f656e67696e652532395f6c6f676f2e7376672e706e67)

## Soal 

Nana adalah mahasiswa semester 6 dan sekarang sedang mengambil matakuliah komputasi awan. Saat mengambil matakuliah komputasi awan dia mendapatkan materi sesilab tentang Docker. Suatu hari Nana ingin membuat sistem reservasi lab menggunakan Python Flask. Dia dibantu temannya, Putra awalnya membuat web terlebih dahulu. Web dapat di download [disini](https://cloud.fathoniadi.my.id/reservasi.zip).

Setelah membuat web, Putra dan Nana membuat Custom Image Container menggunakan Dockerfile. Mereka membuat image container menggunakan base container ubuntu:16.04 kemudian menginstall aplikasi flask dan pendukungnya agar website dapat berjalan [1].

Setelah membuat custom image container, mereka kemudian membuat file docker-compose.yml. Dari custom image yang dibuat sebelumnya mereka membuat 3 node yaitu worker1, worker2, dan worker3 [2].

Setelah mempersiapkan worker, mereka kemudian menyiapkan nginx untuk loadbalancing ketiga worker tersebut (diperbolehkan menggunakan images container yang sudah jadi dan ada di Docker Hub) [3].

Karena web mereka membutuhkan mysql sebagai database, terakhir mereka membuat container mysql (diperbolehkan menggunakan images container yang sudah jadi dan ada di Docker Hub) yang dapat diakses oleh ke-3 worker yang berisi web mereka tadi dengan environment:

    username : userawan
    password : buayakecil
    nama database : reservasi

Selain setup environmet mysql, mereka juga mengimport dump database web mereka menggunakan Docker Compose dan tak lupa membuat volume agar storage mysql menjadi persisten[4].

## Penyelesaian

[Penyelesaian](https://github.com/nahdazahra/cloud2018/tree/master/Docker/penyelesaian.md)