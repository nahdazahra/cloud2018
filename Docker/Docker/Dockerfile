# Pull base image
FROM ubuntu:16.04

# Install python dan dependencies-nya untuk menjalankan Flask
RUN apt-get update -y
RUN apt-get -y upgrade
RUN apt-get install -y libmysqlclient-dev python-dev python-pip build-essential libssl-dev libffi-dev
RUN apt-get install -y wget apt-utils zip python2.7 
RUN pip install --upgrade pip

# Download Web Reservasi lab yang dibuat menggunakan python flask
RUN wget https://cloud.fathoniadi.my.id/reservasi.zip 
RUN unzip reservasi.zip
RUN mv reservasi reservasi-flask

# Berpindah direktori 
WORKDIR reservasi-flask

# Install dependencies web flask
RUN pip install -r req.txt

# Menjalankan python saat docker dijalankan
ENTRYPOINT ["python"]

# Menjalankan server.py
CMD ["server.py"]

# Port 80
EXPOSE 80