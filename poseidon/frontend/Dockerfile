FROM trion/ng-cli-karma

# This image is used in the dashboard's build pipeline
# Earlier, FROM trion/ng-cli-karma was used but as we had to
# create a docker image for Dashboard as well docker is added.
MAINTAINER Pallav Jha "pallav dot jha at soroco.com"

RUN curl -fsSL https://get.docker.com | sh \
 && apt-get install -y lrzip


USER $USER_ID
