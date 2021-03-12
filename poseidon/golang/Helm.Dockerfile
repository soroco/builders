FROM ubuntu:20.10
RUN apt-get update -y && \
    apt-get install -y wget && \
    cd /tmp/ && \
    wget https://get.helm.sh/helm-v3.5.2-linux-amd64.tar.gz && \
    tar xf helm-v3.5.2-linux-amd64.tar.gz && \
    cp linux-amd64/helm /usr/local/bin/
