FROM golang:1.13

LABEL docker_file="github.com/soroco/builders/poseidon/golang/UbuntuTask.Dockerfile"

RUN apt-get update -y && \
    curl -sL https://taskfile.dev/install.sh | sh  && \
    curl -fsSL https://get.docker.com | sh && \
    apt-get install -y lrzip
