# Node Server

FROM centos:7
MAINTAINER Ralph Wiedemeier <ralph@framefactory.ch>

LABEL version="0.1"
LABEL description="node.js server"

RUN yum update -y

COPY /provisioning/centos/30-centos-nodejs.sh /tmp
RUN sh /tmp/30-centos-nodejs.sh

RUN mkdir /projects
VOLUME /projects

ENTRYPOINT ["nodemon"]