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
#   Primary Author: Manthan Sharma <manthan.sharma@soroco.com>

FROM golang:1.12
MAINTAINER Manthan Sharma <manthan.sharma@soroco.com>

ENV PROTOC_GEN_VER v1.3.1
ENV BINDATA_VER v3.1.1

RUN apt-get update && \
    apt-get install -y unzip git make openssh-client sudo && \
    apt-get clean && \
    go get -u github.com/rakyll/gotest \
              golang.org/x/lint/golint \
              github.com/volatiletech/sqlboiler \
              github.com/go-bindata/go-bindata/... \
              github.com/glerchundi/sqlboiler-crdb && \
    curl -sL https://taskfile.dev/install.sh | sh && \
    wget -qO- https://binaries.cockroachdb.com/cockroach-v2.1.6.linux-amd64.tgz | tar xvz && \
    cp cockroach-v2.1.6.linux-amd64/cockroach /usr/local/bin && \
    rm -rf cockroach-v2.1.6.linux-amd64 && \
    wget -qO- https://github.com/golang-migrate/migrate/releases/download/v4.2.5/migrate.linux-amd64.tar.gz | tar xvz && \
    mv migrate.linux-amd64 /usr/local/bin/migrate && \
    rm -rf migrate.linux-amd64 && \
    wget -q https://github.com/protocolbuffers/protobuf/releases/download/v3.7.0/protoc-3.7.0-linux-x86_64.zip && \
    unzip protoc-3.7.0-linux-x86_64.zip bin/protoc -d protoc && \
    mv protoc/bin/protoc /usr/local/bin && \
    rm -r protoc-3.7.0-linux-x86_64.zip protoc && \
    go get -d -u github.com/go-bindata/go-bindata && \
    git -C "$(go env GOPATH)"/src/github.com/go-bindata/go-bindata checkout $BINDATA_VER && \
    go install github.com/go-bindata/go-bindata && \
    go get -d -u github.com/golang/protobuf/protoc-gen-go && \
    git -C "$(go env GOPATH)"/src/github.com/golang/protobuf checkout $PROTOC_GEN_VER && \
    go install github.com/golang/protobuf/protoc-gen-go && \
    wget -qO /usr/local/bin/protoc-gen-grpc-web https://github.com/grpc/grpc-web/releases/download/1.0.3/protoc-gen-grpc-web-1.0.3-linux-x86_64 && \
    chmod 0755 -R /usr/local/bin/ "$(go env GOPATH)"/bin && \
    chmod 0777 -R /go/pkg

