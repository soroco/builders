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
ENV SQLBOILER_VER v3.2.0
ENV SQLBOILER_CRDB_COMMIT f175c13
ENV DEP_RELEASE_TAG v0.5.0
RUN apt-get update && \
    apt-get install -y rsyslog unzip git make openssh-client sudo python3 libnss3-tools && \
    apt-get clean && \
    go get -u github.com/rakyll/gotest \
              golang.org/x/lint/golint && \
    curl -sL https://taskfile.dev/install.sh | sh && \
    curl -sL https://raw.githubusercontent.com/golang/dep/master/install.sh | sh && \
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
    go get -d -u github.com/volatiletech/sqlboiler && \
    git -C "$(go env GOPATH)"/src/github.com/volatiletech/sqlboiler checkout $SQLBOILER_VER && \
    cd "$(go env GOPATH)"/src/github.com/volatiletech/sqlboiler && \
    go get -d ./... && \
    cd - && \
    go install github.com/volatiletech/sqlboiler && \
    go get -d -u github.com/go-bindata/go-bindata && \
    git -C "$(go env GOPATH)"/src/github.com/go-bindata/go-bindata checkout $BINDATA_VER && \
    go install github.com/go-bindata/go-bindata/... && \
    go get -d -u github.com/golang/protobuf/protoc-gen-go && \
    git -C "$(go env GOPATH)"/src/github.com/golang/protobuf checkout $PROTOC_GEN_VER && \
    go install github.com/golang/protobuf/protoc-gen-go && \
    go get -d github.com/glerchundi/sqlboiler-crdb && \
    git -C "$(go env GOPATH)"/src/github.com/glerchundi/sqlboiler-crdb checkout $SQLBOILER_CRDB_COMMIT && \
    go install github.com/glerchundi/sqlboiler-crdb && \
    wget -qO /usr/local/bin/protoc-gen-grpc-web https://github.com/grpc/grpc-web/releases/download/1.0.6/protoc-gen-grpc-web-1.0.6-linux-x86_64 && \
    curl -sfL https://raw.githubusercontent.com/securego/gosec/master/install.sh | sh -s v2.1.0 && \
    go get github.com/jstemmer/go-junit-report && \
    go get github.com/axw/gocov/gocov && \
    go get github.com/AlekSi/gocov-xml && \
    go get -u gopkg.in/matm/v1/gocov-html && \
    wget https://dl.influxdata.com/influxdb/releases/influxdb_1.7.7_amd64.deb && \
    sudo dpkg -i influxdb_1.7.7_amd64.deb && \
    wget https://github.com/square/ghostunnel/releases/download/v1.4.1/ghostunnel-v1.4.1-linux-amd64-with-pkcs11 -O $GOPATH/bin/ghostunnel && \
    wget https://github.com/FiloSottile/mkcert/releases/download/v1.3.0/mkcert-v1.3.0-linux-amd64 -O $GOPATH/bin/mkcert && \
    chmod 0755 -R /usr/local/bin/ "$(go env GOPATH)"/bin && \
    chmod 0777 -R /go/pkg
