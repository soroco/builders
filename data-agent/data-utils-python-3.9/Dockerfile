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

FROM dockershelf/python:3.9-stable
MAINTAINER Manthan Sharma <manthan.sharma@soroco.com>

RUN apt-get update && \
    apt-get install -y git make wget && \
    apt-get clean
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update && \
    apt-get install -y nodejs && \
    apt-get clean
RUN wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb
RUN apt-get update && \
    apt-get install -y mono-complete dotnet-sdk-6.0 clang libglib2.0-dev && \
    apt-get clean
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1
RUN pip install poetry
