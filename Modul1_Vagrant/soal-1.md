## Dokumentasi Soal 1
# Membuat User dan Password di Vagrant VirtualBox

Soal :
```
Buat vagrant virtualbox dan buat user 'awan' dengan password 'buayakecil'
```
## Persyaratan
* Telah mengikuti [Modul 1 Cloud 2018](https://github.com/fathoniadi/cloud-2018/tree/master/vagrant "Modul 1 Cloud 2018") tentang Vagrant
## Penyelesaian
### **Langkah 1**
Membuat sebuah vagrant virtualbox dengan langkah-langkah dan konfigurasi yang telah diajarkan pada [Modul 1 Cloud 2018](https://github.com/fathoniadi/cloud-2018/tree/master/vagrant "Modul 1 Cloud 2018")

### **Langkah 2**
Membuat bash script dengan nama **user-config.sh** pada folder yang sama dengan **Vagrantfile**
```bash
nano user-config.sh
```
dengan isi :
```
#!/usr/bin/env bash

useradd -d /home/"awan" -m -s /bin/bash "awan"
echo -e "buayakecil\nbuayakecil\n" | passwd "awan"
```
kemudian simpan file.

### **Langkah 3**
Buka **Vagrantfile**
```bash
nano Vagrantfile
```
lalu, diatas ```end``` paling terakhir, tambahkan baris berikut :
```bash
    config.vm.provision "shell", path: "user-config.sh"
 ```
sehingga menjadi :
```bash
    config.vm.provision "shell", path: "user-config.sh"
end
 ```

Atau, jika ingin langsung menambahkan bash script pada **Vagrantfile**-nya (inline) juga bisa, sehingga tidak perlu membuat file script .sh seperti langkah 2 diatas.

Caranya, uncomment baris ini :
```bash
# config.vm.provision "shell", inline: <<-SHELL
#   	apt-get update
#   	apt-get install -y apache2
# SHELL
```
dan edit menjadi seperti ini :
```bash
config.vm.provision "shell", inline: <<-SHELL
    useradd -d /home/"awan" -m -s /bin/bash "awan"
    echo -e "buayakecil\nbuayakecil\n" | passwd "awan"
SHELL
```
kemudian simpan file.

*) Ingat! Hanya gunakan satu metode provisioning, yang inline maupun path, jangan dua-dunya. Untuk script yang panjang dan dipakai oleh banyak virtual machine, lebih disarankan menggunakan path.

### **Langkah 4**
Jika vagrant telah dinyalakan, lakukan :
```bash
vagrant reload --provision
```
Namun jika vagrant belum dinyalakan, maka lakukan :
```bash
vagrant up --provision
```

### **Langkah 5**
Lakukan pengecekan apakah provisioning berhasil dengan cara masuk ke dalam virtualisasi menggunakan :
```bash
vagrant ssh
```
Tampilannya masih tetap sama, seperti tidak ada yang berubah.
![1](/soal1/1.png)

Namun sebenarnya, di dalam virtualisasi telah dibuat **user awan** dengan **password buayakecil**. Cara mengeceknya :
```bash
cat /etc/passwd
```
maka akan keluar:
[[gambar]]

Untuk masuk ke dalam ```user awan```, ketikkan :
```bash
su awan
```
kemudian anda akan dimintai **password** dan isikan ```buayakecil```. Anda telah berhasil masuk ke dalam **user awan**.

[[gambar]]

### **Langkah 6**
Config SSH supaya tidak perlu lagi melakukan ```su awan``` dan menjadikan **user awan** menjadi user default vagrant.

Tambahkan :
```bash
config.ssh.username = "awan"
config.ssh.password = "buayakecil"
```
diatas ```end``` paling terakhir pada **Vagrantfile**.

Kemudian lakukan :
```bash
vagrant reload --provision
```
Dan cek dengan cara masuk ke dalam virtualisasi menggunakan :
```bash
vagrant ssh
```

Maka akan tampil seperti ini 



## Kendala
Ada beberapa kendala yang kami hadapi:

1. Jika belum dibuat **user awan** dan **password buayakecil** pada vagrant virtualbox, namun sudah meng-config ```ssh.username``` dan ```ssh.password```, hasilnya selalu gagal
