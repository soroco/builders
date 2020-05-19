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

FROM golang:1.13
MAINTAINER Manthan Sharma <manthan.sharma@soroco.com>

ENV DEP_RELEASE_TAG v0.5.0

ENV PROTOC_VER 3.11.2
ENV PROTOC_GO_GEN_VER v1.3.2
ENV PROTOC_GRPC_WEB_VER 1.0.7

ENV BINDATA_VER v3.16.0
ENV SQLBOILER_VER v4.1.2

ENV COCKROACH_DB_VER v19.2.0
ENV GOMIGRATE_VER v4.8.0

ENV INFLUXDB_VER 1.7.7
ENV GHOSTTUNNEL_VER v1.5.2
ENV MKCERT_VER v1.4.1

ENV GOSEC_VER v2.1.0

RUN apt-get update && \
    apt-get install -y rsyslog unzip git make openssh-client sudo python3 libnss3-tools && \
    apt-get clean && \
    go get -u github.com/rakyll/gotest \
              golang.org/x/lint/golint && \
    curl -sL https://taskfile.dev/install.sh | sh && \
    curl -sL https://raw.githubusercontent.com/golang/dep/master/install.sh | sh && \
    wget -nv -O- https://binaries.cockroachdb.com/cockroach-$COCKROACH_DB_VER.linux-amd64.tgz | tar xvz && \
    cp cockroach-$COCKROACH_DB_VER.linux-amd64/cockroach /usr/local/bin && \
    wget -nv https://dl.influxdata.com/influxdb/releases/influxdb_${INFLUXDB_VER}_amd64.deb && \
    sudo dpkg -i influxdb_${INFLUXDB_VER}_amd64.deb && \ 
    wget -nv https://github.com/square/ghostunnel/releases/download/$GHOSTTUNNEL_VER/ghostunnel-$GHOSTTUNNEL_VER-linux-amd64-with-pkcs11 -O $GOPATH/bin/ghostunnel && \
    wget -nv https://github.com/FiloSottile/mkcert/releases/download/$MKCERT_VER/mkcert-$MKCERT_VER-linux-amd64 -O $GOPATH/bin/mkcert && \
    wget -nv -O- https://github.com/golang-migrate/migrate/releases/download/$GOMIGRATE_VER/migrate.linux-amd64.tar.gz | tar xvz && \
    mv migrate.linux-amd64 /usr/local/bin/migrate && \
    GO111MODULE=on go get -u github.com/kevinburke/go-bindata/...@$BINDATA_VER && \
    GO111MODULE=on go get -u github.com/volatiletech/sqlboiler/v4@$SQLBOILER_VER && \
    GO111MODULE=on go get -u github.com/glerchundi/sqlboiler-crdb/v4 && \
    wget -nv https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOC_VER/protoc-$PROTOC_VER-linux-x86_64.zip && \
    unzip protoc-$PROTOC_VER-linux-x86_64.zip bin/protoc -d protoc && \
    mv protoc/bin/protoc /usr/local/bin && \
    wget -nv -O /usr/local/bin/protoc-gen-grpc-web https://github.com/grpc/grpc-web/releases/download/$PROTOC_GRPC_WEB_VER/protoc-gen-grpc-web-$PROTOC_GRPC_WEB_VER-linux-x86_64 && \
    GO111MODULE=on go get -u github.com/golang/protobuf/protoc-gen-go@$PROTOC_GO_GEN_VER && \
    go get github.com/jstemmer/go-junit-report && \
    go get github.com/axw/gocov/gocov && \
    go get github.com/AlekSi/gocov-xml && \
    go get -u gopkg.in/matm/v1/gocov-html && \
    curl -sfL https://raw.githubusercontent.com/securego/gosec/master/install.sh | sh -s $GOSEC_VER && \
    rm -rf migrate.linux-amd64 cockroach-$COCKROACH_DB_VER.linux-amd64 protoc-$PROTOC_VER-linux-x86_64.zip protoc influxdb_${INFLUXDB_VER}_amd64.deb && \
    chmod 0755 -R /usr/local/bin/ "$(go env GOPATH)"/bin && \
    chmod 0777 -R /go/pkg

