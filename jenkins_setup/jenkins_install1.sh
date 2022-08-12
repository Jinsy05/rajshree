apt-get update && apt-get install -y --no-install-recommends openjdk-11-jdk wget git  ca-certificates lsb-release gnupg curl zip && rm -rf /var/lib/apt/lists/*

#update-ca-certificates -f
# Jenkins is run with user `jenkins`, uid = 1000
# If you bind mount a volume from the host or a data container,
# ensure you use the same uid
groupadd -g 1000 jenkins && useradd -d "/var/jenkins_home" -u 1000 -g 1000 -m -s /bin/bash jenkins

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ |  tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "upgrading OS"

apt-get update
echo "installing jenkins....................."
apt-get install -y jenkins

echo "installation done"
