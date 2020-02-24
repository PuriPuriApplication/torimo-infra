FROM ubuntu:18.04

RUN apt-get -y update &&\
    apt-get -y install mysql-client

WORKDIR /

COPY . .

CMD ["bash", "/execute_ddl.sh"]
