FROM jenkinsci/jenkins:2.0-rc-1
USER root
RUN apt-get update
RUN apt-get -y install sudo git docker.io python-pip
RUN pip install docker-compose
RUN usermod -aG docker jenkins
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN service docker start
USER jenkins
