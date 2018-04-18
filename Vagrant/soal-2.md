## Dokumentasi Soal 2
# Instalasi Phoenix Web Framework dengan Provision

## Soal

```
Buat vagrant virtualbox dan lakukan provisioning install Phoenix Web Framework
```

## Penyelesaian
### **Langkah 1** - Membuat Vagrant Virtual Box serta konfigurasinya
Membuat sebuah vagrant virtualbox dengan langkah-langkah dan konfigurasi yang telah diajarkan pada [Modul 1 Komputasi Awan 2018](https://github.com/fathoniadi/cloud-2018/tree/master/vagrant "Modul 1 Komputasi Awan 2018")

### **Langkah 2** - Membuat Provision Script
1. Membuat bash script dengan nama **installation.sh** pada folder yang sama dengan **Vagrantfile**

    ```bash
    nano installation.sh
    ```
2. Menuliskan script berikut

    ```bash
    #!/usr/bin/env bash

    # # fix elixir locale warning
    locale-gen UTF-8
    sudo dpkg-reconfigure locales

    # # install phoenix dependencies
    sudo apt-get update
    sudo apt-get install -y elixir
    mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez
    sudo dpkg -i erlang-solutions_1.0_all.deb
    sudo apt-get install -y esl-erlang
    yes | sudo mix local.hex

    # # installing phoenix archive
    yes | sudo mix archive.install --force https://github.com/phoenixframework/archives/raw/maste$
    mkdir /home/vagrant/senang
    yes | sudo mix phx.new --no-ecto --no-brunch /home/vagrant/senang

    #cd /home/vagrant/senang
    yes | sudo mix deps.get
    yes | sudo mix phx.server
    ```

### **Langkah 3** - Mengedit Vagrantfile
1. Edit file **Vagrantfile**

    ```bash
    nano Vagrantfile
    ```
2. Menambahkan baris berikut 

    ```bash
    config.vm.provision "shell", path: "installation.sh"
    ```
    diatas ```end``` paling terakhir

3. Simpan **Vagrantfile**

### **Langkah 4** - Reload Box Vagrant untuk menjalankan provision
1. Jika box vagrant telah diaktifkan, jalankan command 

    ```bash
    vagrant reload --provision
    ```
    Jika box vagrant belum diaktifkan, maka jalankan command 

    ```bash
    vagrant up --provision
    ```
Maka, vagrant akan melakukan instalasi sesuai script pada **installation.sh**

## Script

[Vagrant Load Balancer](blabla)