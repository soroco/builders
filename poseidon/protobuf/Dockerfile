#   Copyright 2019 Soroco Americas Private Limited
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
#   Primary Author: Pallav Jha <pallav.jha@soroco.com>

FROM soroco/builders:python3.7-node10-slim
MAINTAINER Pallav Jha <pallav.jha@soroco.com>

ENV GO_VER 1.12.7
ENV PROTOC_VER 3.7.0
ENV PROTOC_GEN_VER v1.3.1
ENV PROTOC_GEN_WEB_VER 1.0.3
ENV PYTHON_GRPC_IO_VER 1.20.0

RUN apt-get update && \
    apt install wget unzip libatomic1 && \
    # DOWNLOAD AND INSTALL GO LANG
    wget https://dl.google.com/go/go$GO_VER.linux-amd64.tar.gz && \
    sudo tar -xvf go$GO_VER.linux-amd64.tar.gz && sudo mv go /usr/local && export GOROOT=/usr/local/go && \
    export PATH=$GOPATH/bin:$GOROOT/bin:$PATH && \
    # DOWNLOAD AND INSTALL PROTOC
    wget -q https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOC_VER/protoc-$PROTOC_VER-linux-x86_64.zip && \
    unzip protoc-$PROTOC_VER-linux-x86_64.zip bin/protoc -d protoc && \
    mv protoc/bin/protoc /usr/local/bin && \
    rm -r protoc-$PROTOC_VER-linux-x86_64.zip protoc && \
    # DOWNLOAD AND INSTALL PROTO-GEN-GO
    go get -d -u github.com/golang/protobuf/protoc-gen-go && \
    git -C "$(go env GOPATH)"/src/github.com/golang/protobuf checkout $PROTOC_GEN_VER && \
    go install github.com/golang/protobuf/protoc-gen-go && \
    # DOWNLOAD AND INSTALL PROTO-GEN-GRPC-WEB
    wget -qO /usr/local/bin/protoc-gen-grpc-web https://github.com/grpc/grpc-web/releases/download/$PROTOC_GEN_WEB_VER/protoc-gen-grpc-web-$PROTOC_GEN_WEB_VER-linux-x86_64 && \
    # DOWNLOAD TASK
    curl -sL https://taskfile.dev/install.sh | sh && \
    # DOWNLOAD AND INSTALL PYTHON gRPC-IO
    python -m pip install "grpcio==$PYTHON_GRPC_IO_VER" "grpcio-tools==$PYTHON_GRPC_IO_VER" && \
    chmod +x /usr/local/bin/protoc && \
    cp /root/go/bin/protoc-gen-go /usr/local/bin/ && \
    chmod +x /usr/local/bin/protoc-gen-go && \
    chmod +x /usr/local/bin/protoc-gen-grpc-web

WORKDIR /proto

ENTRYPOINT task protoc
