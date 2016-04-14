FROM jenkinsci/jenkins:2.0-rc-1
USER root
RUN apt-get update
RUN apt-get install sudo
RUN apt-get install curl
RUN curl -sSL https://get.docker.com/ | sh
RUN usermod -aG docker jenkins
RUN curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
USER jenkins
