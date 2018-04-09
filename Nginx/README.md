# Load Balancing with Nginx

![Nginx as Load Balancer](https://static.thegeekstuff.com/wp-content/uploads/2017/01/nginx-loadbalancer.png)

## Soal dan Penyelesaian
Buatlah sistem load balancing dengan 1 load balancer (Nginx dan 2 worker (Apache2)), terapkan algoritma load balancing **round-robin**, **least-connected**, dan **ip-hash**.

Soal :

1. Buatlah Vagrantfile sekaligus provisioning-nya untuk menyelesaikan kasus.

    [Penyelesaian](https://github.com/nahdazahra/cloud2018/blob/master/Nginx/soal-1.md)

2. Analisa apa perbedaan antara ketiga algoritma tersebut.

    [Penyelesaian](https://github.com/nahdazahra/cloud2018/blob/master/Nginx/soal-2.md)

3. Biasanya pada saat membuat website, data user yang sedang login disimpan pada session. Sesision secara default tersimpan pada memory pada sebuah host. Bagaimana cara mengatasi masalah session ketika kita melakukan load balancing?

    [Penyelesaian](https://github.com/nahdazahra/cloud2018/blob/master/Nginx/soal-3.md)
