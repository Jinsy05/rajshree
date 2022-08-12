FROM ubuntu:latest

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ARG http_port=8080
ARG agent_port=50000

#Jenkins Users to be added 
ENV JENKINS_USER admin
ENV JENKINS_PASS admin


ENV JENKINS_HOME /var/jenkins_home
ENV JENKINS_SLAVE_AGENT_PORT ${agent_port}
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV JENKINS_UC "http://updates.jenkins-ci.org"



# can be persisted and survive image upgrades
VOLUME /var/jenkins_home

COPY *.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY jenkins*.sh  ./
RUN chmod +x jenkins*.sh

RUN echo -e "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN ./jenkins_install.sh 

EXPOSE 8080

#CMD ["java","-jar","/usr/share/java/jenkins.war"]


#RUN wget https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/2.10.0/jenkins-plugin-manager-2.10.0.jar

#CMD ["./jenkins_plugins_install.sh"]

CMD ["sleep", "infinity"]

#COPY jenkins-support /usr/local/bin/jenkins-support
#COPY jenkinsnew.sh /usr/local/bin/jenkinsnew.sh
#ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkinsnew.sh"]
