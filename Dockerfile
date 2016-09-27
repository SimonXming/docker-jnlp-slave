# The MIT License
#
#  Copyright (c) 2015, CloudBees, Inc.
#
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in
#  all copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#  THE SOFTWARE.

FROM centos:7.2.1511

MAINTAINER simon <simon_xu@outlook.com>

ENV JENKINS_HOME /home/jenkins

ARG user=jenkins
ARG group=docker
ARG uid=1000
ARG gid=993

RUN yum update -y && \
yum install -y epel-release java-1.8.0-openjdk git && \
yum install -y python-pip && \
yum clean all && \
rm -r -f /var/cache/* && \
rm -r -f /tmp/*

RUN groupadd -g ${gid} ${group} \
    && useradd -u ${uid} -g ${gid} -d "$JENKINS_HOME" -m -s /bin/bash ${user}

RUN pip install requests && pip install docker-py==1.10.2

COPY slave.jar /usr/share/jenkins/slave.jar
RUN chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/slave.jar

COPY jenkins-slave.py /home/jenkins/jenkins-slave.py

COPY docker_push /usr/local/bin/docker_push
COPY docker_pull /usr/local/bin/docker_pull

VOLUME /home/jenkins
WORKDIR /home/jenkins
USER jenkins

ENTRYPOINT ["python", "jenkins-slave.py"]
