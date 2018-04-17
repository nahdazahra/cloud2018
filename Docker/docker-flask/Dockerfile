# Pull base image
FROM ubuntu:16.04

# Install python and dependencies for Flask installation
RUN apt-get update -y
RUN apt-get --force-yes upgrade
RUN apt-get install -y libmysqlclient-dev python-dev python-pip build-essential libssl-dev libffi-dev

WORKDIR ~

COPY . /app

WORKDIR /app

RUN pip install --upgrade distribute pip setuptools
RUN pip install -r req.txt

ENTRYPOINT ["python"]

CMD ["/app/server.py"]
EXPOSE 80