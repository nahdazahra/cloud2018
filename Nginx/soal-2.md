## Dokumentasi Soal 2
# Perbedaan Algoritma Load Balancing

## Soal
```
Analisa apa perbedaan antara ketiga algoritma tersebut.
```

## Penyelesaian
### **Round-robin**
Algoritma ini akan menjalankan load balancing seperti *loop cycle*, sesuai dengan urutan array IP yang didefinisikan pada Load Balancer.
### **Least Connection**
Algoritma yang memberikan request pada web server berdasarkan server mana yang paling sedikit mempunyai ***active session***.
### **IP Hash**
Algoritma ini akan membuat *key* dari IP client dan server, dimana *key* tersebut akan digunakan untuk menempatkan (*request*) client ke server tertentu, sehingga pada pergantian sesi selanjutnya, request client akan langsung diarahkan ke server yang digunakan sebelumnyadan *key* akan di *generate* ulang.
Algoritma ini berguna untuk sistem yang membutuhkan client terhubung ke suatu *session* yang sama setelah terjadi pergantian *session*.
