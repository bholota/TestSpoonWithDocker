FROM jenkinsci/jenkins:2.0-rc-1
USER root
RUN apt-get update
RUN apt-get install sudo
RUN apt-get install curl
RUN curl -sSL https://get.docker.com/ | s
RUN usermod -aG docker jenkins
USER jenkins