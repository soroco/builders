FROM ubuntu:20.10

LABEL docker_file="github.com/soroco/builders/poseidon/golang/Helm.Dockerfile"

RUN apt-get update -y && \
	apt-get install -y wget && \
	cd /tmp/ && \
	wget https://get.helm.sh/helm-v3.5.2-linux-amd64.tar.gz && \
	tar xf helm-v3.5.2-linux-amd64.tar.gz && \
	cp linux-amd64/helm /usr/local/bin/
