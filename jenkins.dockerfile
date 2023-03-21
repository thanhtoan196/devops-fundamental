FROM jenkins/jenkins:alpine

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /bin/jenkins-plugin-cli -f /usr/share/jenkins/plugins.txt
EXPOSE 8080