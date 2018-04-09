## Dokumentasi Soal 3
# Mengatasi Masalah Session pada Load Balancing

## Soal

```
Biasanya pada saat membuat website, data user yang sedang login disimpan pada session. 
Session secara default tersimpan pada memory pada sebuah host. 
Bagaimana cara mengatasi masalah session ketika kita melakukan load balancing?
```

## Penyelesaian

Pada sebuah website yang hanya dilayani oleh 1 server, request pertama kali yang masuk dari client akan membentuk **data session user** yang disimpan dalam memori server tersebut. Lalu request selanjutnya yang masuk akan tetap dilayani oleh 1 server yang sama sembari memperbarui data session yang tersimpan.

Lain halnya jika website tersebut dilayani oleh beberapa server yang diatur menggunakan **Load Balancer**. Load balancer menentukan server mana yang harus melayani setiap kali ada request masuk. Katakanlah ada server A, B, dan C. Bisa jadi www.daus.com/index dilayani oleh server A, www.daus.com/login dilayani oleh server B, dan www.daus.com/account dilayani oleh server C.

Nah, jika ada 3 server yang melayani, maka masing-masing server itu akan membuat data sessionnya sendiri-sendiri yang disimpan dalam memori masing-masing, sehingga kita harus selalu mengsinkronkan session supaya tetap sama antar server satu sama lain. Untuk mensinkronkan session, kita harus **menyimpan data session di layer yang bisa diakses oleh seluruh server**, contohnya database. Tapi ini bukan cara yang baik. Mengapa? karena session sifatnya sementara, sehingga tidak disimpan secara persisten di dalam database.

#### **Case 1**

Jika kalian masih kesulitan membayangkan pentingnya masalah session dalam load balancing, mari kita lihat studi kasus berikut:

Pada sebuah web online shop, user A mengisi shopping cart dengan barang-barang yang ingin dibelinya. Barang-barang dalam shopping cart memang sudah dipilih, namun belum dipesan. Karena sifatnya sementara dan bisa dibatalkan sewaktu-waktu, maka data tersebut hanya disimpan ke dalam session dan tidak disimpan ke dalam database.

Si user A memilih barang pertama di **server A**, namun saat memilih barang kedua, ia dilayani oleh **server B**. Karena barang pilihan pertama tersimpan di session server A, maka ketika dia memilih barang kedua di server B hanya terihat 1 barang yang sudah dipilih, padahal ada 2 barang (barang 1-nya ketinggalan di server A)


Permasalahan terkait session seperti contoh di atas dapat diatasi dengan **Sticky Session**.

**Sticky Session** adalah suatu cara mempersistenkan session dalam load balancing dengan mengarahkan semua request dari satu client ke satu server yang sama secara terus menerus (walaupun ada server lain yang tersedia), sehingga data sessionnya persisten dan tidak berpencar-pencar. Gampangnya lihat gambar dibawah ini:

![sticky session](https://wwwimages2.adobe.com/content/dam/acom/en/devnet/coldfusion/articles/clustering_cf8/1283240747221.jpg)

User 1 akan tetap dilayani oleh server 1 dan user 2 akan tetap dilayani oleh server 2.
