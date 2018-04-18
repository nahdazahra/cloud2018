# Membuat Custom Image Docker dengan Dockerfile

## Prerequisite

- Download web yang telah dibuat sebelumnya [di sini](https://cloud.fathoniadi.my.id/reservasi.zip).
- Gunakan base container ubuntu:16:04.
- Install Flask dan *packages* pendukungnya.

1. Ekstrak web yang telah di download.
    ```bash
    unzip reservasi.zip
    ```
    
2. Buat Dockerfile pada folder web tersebut.
    ```bash
    cd reservasi
    nano Dockerfile
    ```

3. Isi file Dockerfile dengan script berikut.
    ```yaml
    # Pull base image
    FROM ubuntu:16.04

    # Install python and dependencies for Flask installation
    RUN apt-get update -y
    RUN apt-get upgrade -y
    RUN apt-get install -y libmysqlclient-dev python-dev python-pip build-essential libssl-dev libffi-dev

    WORKDIR ~

    # Copy all files from current folder to image container  
    COPY . /app

    WORKDIR /app

    # Install Flask and web dependencies
    RUN pip install --upgrade distribute pip setuptools
    RUN pip install -r req.txt

    # Run web service
    ENTRYPOINT ["python"]
    CMD ["/app/server.py"]

    # Define port
    EXPOSE 80
    ```

4. Buat image container tersebut dengan nama `ubuntu-flask`.
    ```bash
    docker build -t ubuntu-flask ./
    ```