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

FROM docker.io/library/golang:1.20
LABEL maintainer="Scout Data Agent Team <data-agent@soroco.com>"

ENV STATICCHECKER_VER 2023.1.1
ENV GOVULNCHECK_VER latest
ENV SWAG_VER v1.8.10
ENV GOLANG_LINT_VER v1.51.1

WORKDIR /go

RUN go install golang.org/x/vuln/cmd/govulncheck@GOVULNCHECK_VER
RUN go install github.com/golangci/golangci-lint/cmd/golangci-lint@$GOLANG_LINT_VER
RUN go install honnef.co/go/tools/cmd/staticcheck@$STATICCHECKER_VER
RUN go install github.com/swaggo/swag/cmd/swag@$SWAG_VER
RUN go install github.com/axw/gocov/gocov@latest
RUN go install github.com/AlekSi/gocov-xml@latest
RUN go install github.com/jstemmer/go-junit-report/v2@latest
RUN chown -R 1000:1000 /go
RUN wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb
RUN apt-get update && \
    apt-get install -y dotnet-sdk-6.0 openjdk-11-jre zip make && \
    apt-get clean
