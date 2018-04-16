FROM ubuntu:16.04

RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
RUN echo mysql-server mysql-server/root_password password xyz | debconf-set-selections
RUN echo mysql-server mysql-server/root_password_again password xyz | debconf-set-selections
RUN apt install -y mysql-server libmysqlclient-dev

COPY . /app
WORKDIR /app

RUN pip install --upgrade pip
RUN pip install -r req.txt

ENV DB_HOST localhost
ENV DB_USERNAME root
ENV DB_PASSWORD xyz
ENV DB_NAME reservasi

ENTRYPOINT ["python"]
CMD ["server.py"]

EXPOSE 80
