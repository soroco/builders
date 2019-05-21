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

FROM python:3.6-slim
MAINTAINER Manthan Sharma <manthan.sharma@soroco.com>

RUN apt-get -y update \
    && apt-get install -y apt-utils sudo curl git lrzip gnupg2 \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs \
    && curl -L https://www.npmjs.com/install.sh | sh \
    && curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-18.09.3.tgz \
    && tar --strip-components=1 -xvzf docker-18.09.3.tgz -C /usr/local/bin \
    && rm docker-18.09.3.tgz \
    && apt-get clean all
