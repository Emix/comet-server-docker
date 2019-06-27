FROM ubuntu:18.04
MAINTAINER Basyrov Emil <emil@basyrov.me>
RUN apt-get update  && \
    apt-get install -y cmake make cpp gcc libssl-dev g++ nginx pkg-config libmariadbclient-dev-compat mysql-client flex uuid-dev git && \
    rm -rf /var/lib/apt/lists/* && \
    git clone https://github.com/Levhav/comet-server


RUN mv comet-server/ app && \
    cd app && \
    cmake . && \
    make && \
    make install

COPY /comet.ini /etc/comet-server/



WORKDIR /app
EXPOSE 8087