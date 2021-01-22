#   Copyright 2020 Soroco Americas Private Limited
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
# WARNING: THIS DOCKERFILE IS NOT INTENDED FOR PRODUCTION USE OR DEPLOYMENT.
#
#   Primary Author: Naresh Bohra <naresh@soroco.com>

ARG PYTHON_BASE_IMAGE="python:3.6-slim-buster"
FROM ${PYTHON_BASE_IMAGE} as main

LABEL docker_file="github.com/soroco/builders/blob/master/poseidon/airflow/Dockerfile"

SHELL ["/bin/bash", "-o", "pipefail", "-e", "-u", "-x", "-c"]

ARG PYTHON_BASE_IMAGE="python:3.6-slim-buster"
ENV PYTHON_BASE_IMAGE=${PYTHON_BASE_IMAGE}

ARG AIRFLOW_VERSION="2.0.0.dev0"
ENV AIRFLOW_VERSION=$AIRFLOW_VERSION

ARG PYTHON_MAJOR_MINOR_VERSION="3.6"
ENV PYTHON_MAJOR_MINOR_VERSION=${PYTHON_MAJOR_MINOR_VERSION}

ARG UPGRADE_TO_LATEST_REQUIREMENTS="false"
ENV UPGRADE_TO_LATEST_REQUIREMENTS=${UPGRADE_TO_LATEST_REQUIREMENTS}

# Print versions
RUN echo "Base image: ${PYTHON_BASE_IMAGE}"
RUN echo "Airflow version: ${AIRFLOW_VERSION}"

# Make sure noninteractive debian install is used and language variables set
ENV DEBIAN_FRONTEND=noninteractive LANGUAGE=C.UTF-8 LANG=C.UTF-8 LC_ALL=C.UTF-8 \
    LC_CTYPE=C.UTF-8 LC_MESSAGES=C.UTF-8

# By increasing this number we can do force build of all dependencies
ARG DEPENDENCIES_EPOCH_NUMBER="4"
# Increase the value below to force renstalling of all dependencies
ENV DEPENDENCIES_EPOCH_NUMBER=${DEPENDENCIES_EPOCH_NUMBER}

# Install curl and gnupg2 - needed to download nodejs in the next step
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
           curl \
           gnupg2 \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ARG ADDITIONAL_DEV_DEPS=""
ENV ADDITIONAL_DEV_DEPS=${ADDITIONAL_DEV_DEPS}

# Install basic and additional apt dependencies
RUN curl --fail --location https://deb.nodesource.com/setup_10.x | bash - \
    && curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - > /dev/null \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
           apt-utils \
           build-essential \
           dirmngr \
           dumb-init \
           freetds-bin \
           freetds-dev \
           git \
           graphviz \
           gosu \
           libffi-dev \
           libkrb5-dev \
           libpq-dev \
           libsasl2-2 \
           libsasl2-dev \
           libsasl2-modules \
           libssl-dev \
           locales  \
           netcat \
           nodejs \
           rsync \
           sasl2-bin \
           sudo \
           yarn \
           ${ADDITIONAL_DEV_DEPS} \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install MySQL client from Oracle repositories (Debian installs mariadb)
RUN KEY="A4A9406876FCBD3C456770C88C718D3B5072E1F5" \
    && GNUPGHOME="$(mktemp -d)" \
    && export GNUPGHOME \
    && for KEYSERVER in $(shuf -e \
            ha.pool.sks-keyservers.net \
            hkp://p80.pool.sks-keyservers.net:80 \
            keyserver.ubuntu.com \
            hkp://keyserver.ubuntu.com:80 \
            pgp.mit.edu) ; do \
          gpg --keyserver "${KEYSERVER}" --recv-keys "${KEY}" && break || true ; \
       done \
    && gpg --export "${KEY}" | apt-key add - \
    && gpgconf --kill all \
    rm -rf "${GNUPGHOME}"; \
    apt-key list > /dev/null \
    && echo "deb http://repo.mysql.com/apt/debian/ stretch mysql-5.6" | tee -a /etc/apt/sources.list.d/mysql.list \
    && apt-get update \
    && apt-get install --no-install-recommends -y \
        libmysqlclient-dev \
        mysql-client \
    && apt-get autoremove -yqq --purge \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN adduser airflow \
    && echo "airflow ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/airflow \
    && chmod 0440 /etc/sudoers.d/airflow

ARG ADDITIONAL_RUNTIME_DEPS=""
ENV ADDITIONAL_RUNTIME_DEPS=${ADDITIONAL_RUNTIME_DEPS}

# Note missing man directories on debian-buster
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=863199
RUN mkdir -pv /usr/share/man/man1 \
    && mkdir -pv /usr/share/man/man7 \
    && apt-get update \
    && apt-get install --no-install-recommends -y \
      gnupg \
      libgcc-8-dev \
      apt-transport-https \
      bash-completion \
      ca-certificates \
      software-properties-common \
      krb5-user \
      ldap-utils \
      less \
      # The latest buster images do not have libpython 2.7 installed and it is needed
      # To run virtualenv tests with python 2
      libpython2.7-stdlib \
      lsb-release \
      net-tools \
      openssh-client \
      openssh-server \
      postgresql-client \
      sqlite3 \
      tmux \
      unzip \
      vim \
      wget \
      lrzip \
      ${ADDITIONAL_RUNTIME_DEPS} \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget -qO- https://binaries.cockroachdb.com/cockroach-v19.2.2.linux-amd64.tgz | tar xvz && \
    cp -i cockroach-v19.2.2.linux-amd64/cockroach /usr/local/bin/ && \
    chmod +x /usr/local/bin/cockroach && \
    curl -fsSL https://get.docker.com | sh

COPY requirements.txt /tmp/
RUN pip install pip==20.2 wheel==0.36.2 && \
    pip install -r /tmp/requirements.txt

ENV PATH="/home/control_admin_azpcontainer/.local/bin/:/usr/local/bin:${PATH}"
