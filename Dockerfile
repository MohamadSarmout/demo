FROM jenkins/jenkins

USER root

# install docker
RUN apt-get update && \
    apt-get -y install apt-transport-https \
        ca-certificates \
        curl \
        gnup2 \
        software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/"$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" 
    apt-get update && \
    apt-get -y install docker-ce

# install docker Compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$ (uname -s)-$ (uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

RUN usermod -aG docker jenkins

USER jenkins