  
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

FROM python:3.6
MAINTAINER Pallav Jha <pallav.jha@soroco.com>

LABEL description="Docker Image used in Airflow's build pipeline."

RUN apt-get -y update \
    && apt-get install -y apt-utils sudo curl git lrzip gnupg2 virtualenv default-libmysqlclient-dev \
    && apt-get install -y apt-utils virtualenv default-libmysqlclient-dev gcc procps \
    && apt-get clean all


RUN umask 022 && pip install pytest \
    && pip install black isort bandit safety
