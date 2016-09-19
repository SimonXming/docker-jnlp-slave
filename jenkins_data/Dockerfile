FROM centos:7.2.1511

MAINTAINER simon <simon_xu@outlook.com>

ENV JENKINS_HOME /var/jenkins_home/

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000

# Jenkins is run with user `jenkins`, uid = 1000
# If you bind mount a volume from the host or a data container,
# ensure you use the same uid
RUN groupadd -g ${gid} ${group} \
    && useradd -d "$JENKINS_HOME" -u ${uid} -g ${gid} -m -s /bin/bash ${user}

COPY jenkins_home/ $JENKINS_HOME

RUN chown -R ${user} $JENKINS_HOME

# Jenkins home directory is a volume, so configuration and build history
# can be persisted and survive image upgrades
VOLUME /var/jenkins_home

USER ${user}

# ENTRYPOINT /usr/bin/python -m SimpleHTTPServer

