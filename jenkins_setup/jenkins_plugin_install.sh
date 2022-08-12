# Fetch the plugin manager file 
wget https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/2.10.0/jenkins-plugin-manager-2.10.0.jar

# Download and install plugins
exec java -jar jenkins-plugin-manager-2.10.0.jar --war  /usr/share/java/jenkins.war --plugin-file /usr/share/jenkins/ref/plugins.txt  --plugin-download-directory /var/jenkins_home/plugins --verbose

