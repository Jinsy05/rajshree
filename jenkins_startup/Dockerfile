FROM jenkins_setup 

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

#COPY jenkins*.sh  ./
RUN jenkins &
# for main web interface:
EXPOSE ${http_port}

# will be used by attached slave agents:
EXPOSE ${agent_port}

RUN wget https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/2.10.0/jenkins-plugin-manager-2.10.0.jar

# Download and install plugins
RUN java -jar jenkins-plugin-manager-2.10.0.jar --war  /usr/share/java/jenkins.war --plugin-file /usr/share/jenkins/ref/plugins.txt  --plugin-download-directory /var/jenkins_home/plugins --verbose




#RUN ./jenkins_plugin_install.sh


# Get plugins
#ENV JENKINS_UC="http://updates.jenkins-ci.org"
#COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
#RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

#ARG JENKINS_VERSION
#Updating packages
#RUN sudo apt-get update
#Installing Jenkins
#RUN sudo apt-get -y install fontconfig openjdk-11-jre
#RUN sudo apt-get install jenkins:${JENKINS_VERSION}


# Add groovy script to Jenkins hook
#COPY --chown=jenkins:jenkins init.groovy.d/ /var/jenkins_home/init.groovy.d/
#COPY init.groovy.d/ /var/jenkins_home/init.groovy.d/

#COPY init.groovy /usr/share/jenkins/ref/init.groovy.d/tcp-slave-agent-port.groovy


#Download & add repository key
#RUN wget -q -O — https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
#RUN curl https://pkg.jenkins.io/debian-stable/jenkins.io.key | gpg --dearmor >/usr/share/keyrings/jenkins.io.key.gpg

#RUN curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
 #   /usr/share/keyrings/jenkins-keyring.asc > /dev/null

#Getting binary file into /etc/apt/sources.list.d
#RUN sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

#RUN echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
#https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
#    /etc/apt/sources.list.d/jenkins.list > /dev/null

#ARG JENKINS_VERSION
#Updating packages
#RUN sudo apt-get update
#Installing Jenkins
#RUN sudo apt-get -y install fontconfig openjdk-11-jre
#RUN sudo apt-get install jenkins:${JENKINS_VERSION}

CMD ["sleep", "infinity"]
