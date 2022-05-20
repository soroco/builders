#   Copyright 2021 Soroco India Private Limited
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
#   Primary Author: Scout Data Agent Team <data-agent@soroco.com>

FROM golang:1.18
LABEL maintainer="Scout Data Agent Team <data-agent@soroco.com>"

ENV GOSEC_VER v2.7.0
ENV STATICCHECKER_VER v0.1.4
ENV NANCY_VER v1.0.20
ENV NANCY_OS_ARCH linux-amd64
ENV SWAG_VER v1.8.1
WORKDIR /go

RUN curl -sfL https://raw.githubusercontent.com/securego/gosec/master/install.sh | sh -s $GOSEC_VER
RUN curl -o ./bin/nancy -L https://github.com/sonatype-nexus-community/nancy/releases/download/$NANCY_VER/nancy-$NANCY_VER-$NANCY_OS_ARCH && \
    chmod +x ./bin/nancy
RUN go install honnef.co/go/tools/cmd/staticcheck@$STATICCHECKER_VER
RUN go install github.com/swaggo/swag/cmd/swag@$SWAG_VER
RUN chown -R 1000:1000 /go
RUN apt-get update && apt-get install -y zip openjdk-11-jre && apt-get clean
