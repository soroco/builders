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

FROM dockershelf/python:3.7
MAINTAINER Manthan Sharma <manthan.sharma@soroco.com>

RUN apt-get update && \
    apt-get install git make wget && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs npm && \
    apt-get clean

RUN pip install poetry
