FROM centos/systemd

LABEL docker_file="github.com/soroco/builders/poseidon/golang/CentosSystemdRunit.Dockerfile"

RUN yum -y install python36 which python36-devel gcc wget tar glibc-static && \
    yum groupinstall -y "Development Tools" && \
    mkdir -p /package ; chmod 1755 /package && \
    cd /tmp; wget http://smarden.org/runit/runit-2.1.2.tar.gz && \
    tar xvzf runit-2.1.2.tar.gz --strip-components=1 && \
    rm runit-2.1.2.tar.gz && \
    cd runit-2.1.2 && \
    package/install && \
    mkdir /etc/service && \
    cd /tmp; wget https://s3.amazonaws.com/rubyists/aur/runit-services/runit-services-1.1.2-1.tar.gz && \
    tar xzvf runit-services-1.1.2-1.tar.gz && \
    cd runit-services/ && \
    install -D -m 0755 rsvlog /usr/bin/rsvlog && \
    install -D -d /etc/sv && for service in etc/sv/*; do cp -a $service /etc/sv/; done && \
    mkdir -p /run/runit/sv/ && \
    yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum -y install jq && \
    yum -y install sudo && \
    wget https://golang.org/dl/go1.13.10.linux-amd64.tar.gz && tar -zxvf go1.13.10.linux-amd64.tar.gz -C /usr/local && \
    cp /usr/local/go/bin/go /usr/local/bin/go && \
    wget -O - https://get.docker.com | sh

CMD /usr/sbin/init
