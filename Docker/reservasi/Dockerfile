# Pull base image
FROM ubuntu:16.04

# Install python and dependencies for Flask installation
RUN apt-get update -y
RUN apt-get --force-yes upgrade
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