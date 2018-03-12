## Dokumentasi Soal 1
# Membuat User dan Password di Vagrant VirtualBox

## Soal

```
Buat vagrant virtualbox dan buat user 'awan' dengan password 'buayakecil'
```

## Penyelesaian
### **Langkah 1** - Membuat Vagrant Virtual Box dan konfigurasinya
Membuat sebuah vagrant virtualbox dengan langkah-langkah dan konfigurasi yang telah diajarkan pada [Modul 1 Komputasi Awan 2018](https://github.com/fathoniadi/cloud-2018/tree/master/vagrant "Modul 1 Komputasi Awan 2018")

### **Langkah 2** - Membuat Provision Script
1. Membuat bash script dengan nama **user-config.sh** pada folder yang sama dengan **Vagrantfile**

    ```bash
    nano user-config.sh
    ```
2. Menuliskan script berikut

    ```
    #!/usr/bin/env bash

    useradd -d /home/"awan" -m -s /bin/bash "awan"
    echo -e "buayakecil\nbuayakecil\n" | passwd "awan"
    ```
3. Menyimpan file **user-config.sh**

### **Langkah 3** - Mengedit Vagrantfile
1. Membuka **Vagrantfile**

    ```bash
    nano Vagrantfile
    ```
2. Menambahkan baris berikut 

    ```bash
        config.vm.provision "shell", path: "user-config.sh"
    ```
    diatas ```end``` paling terakhir, sehingga menjadi 
    
    ```bash
        config.vm.provision "shell", path: "user-config.sh"
    end
    ```
3. Simpan **Vagrantfile**

Jika tidak ingin menggunakan provision script, bisa langsung menambahkan bash script pada **Vagrantfile** (inline). Caranya :

1. Meng-uncomment baris ini 

    ```bash
    # config.vm.provision "shell", inline: <<-SHELL
    #   	apt-get update
    #   	apt-get install -y apache2
    # SHELL
    ```
2. Mengeditnya menjadi seperti ini 

    ```bash
    config.vm.provision "shell", inline: <<-SHELL
        useradd -d /home/"awan" -m -s /bin/bash "awan"
        echo -e "buayakecil\nbuayakecil\n" | passwd "awan"
    SHELL
    ```
3. Simpan **Vagrantfile**

### **Langkah 4** - Reload Virtualisasi untuk menjalankan provisioning
1. Jika vagrant telah dinyalakan, lakukan 

    ```bash
    vagrant reload --provision
    ```
2. Namun jika vagrant belum dinyalakan, maka lakukan 

    ```bash
    vagrant up --provision
    ```

### **Langkah 5** - Melakukan pengecekan
1. Melakukan pengecekan apakah provisioning berhasil dengan cara masuk ke dalam virtualisasi menggunakan

    ```bash
    vagrant ssh
    ```
    Tampilannya masih tetap sama, seperti biasanya
    
    ![Tampilan biasa](https://github.com/nahdazahra/cloud2018/blob/master/Modul1_Vagrant/assets/tampilan1.png)

    Namun sebenarnya, di dalam virtualisasi telah berhasil dibuat **user awan** dengan **password buayakecil**. Cara mengeceknya
    
    ```bash
    cat /etc/passwd
    ```
    maka akan keluar:
    
    ![Daftar user](https://github.com/nahdazahra/cloud2018/blob/master/Modul1_Vagrant/assets/daftar-user.png)

2. Untuk masuk ke dalam ```user awan```, ketikkan

    ```bash
    su awan
    ```
    Dan memasukkan **password** ```buayakecil```
    
    Yay! kita berhasil masuk ke dalam **user awan**.

    ![Daftar user](https://github.com/nahdazahra/cloud2018/blob/master/Modul1_Vagrant/assets/user-awan.png)

### **Langkah 6** - Mengkonfigurasi SSH
Supaya tidak perlu lagi melakukan ```su awan``` dan menjadikan **user awan** menjadi user default vagrant, maka perlu dilakukan konfigurasi SSH. Caranya :

1. Membuka **Vagrantfile**
2. Menambahkan

    ```bash
    config.ssh.username = "awan"
    config.ssh.password = "buayakecil"
    ```
    diatas ```end``` paling terakhir pada **Vagrantfile**

3. Kemudian melakukan 

    ```bash
    vagrant reload --provision
    ```
4. Cek dengan cara masuk ke dalam virtualisasi menggunakan

    ```bash
    vagrant ssh
    ```

Hasilnya akan seperti ini

![Tampilan luar biasa](https://github.com/nahdazahra/cloud2018/blob/master/Modul1_Vagrant/assets/tampilan2.png)


## Kendala
Ada beberapa kendala yang kami hadapi:

1. Jika belum dibuat **user awan** dan **password buayakecil** pada vagrant virtualbox, namun sudah meng-config ```ssh.username``` dan ```ssh.password```, hasilnya selalu gagal

![Kendala](https://github.com/nahdazahra/cloud2018/blob/master/Modul1_Vagrant/assets/kendala.png)
