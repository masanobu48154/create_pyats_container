FROM ubuntu:20.04

COPY requirements.txt /root/
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends python3 python3-pip software-properties-common vim git wget apt-transport-https ca-certificates curl gnupg lsb-release sudo openssh-server telnet && pip3 install --upgrade pip && pip3 install -r /root/requirements.txt && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends docker-ce docker-ce-cli containerd.io && curl -LJO "https://gitlab-runner-downloads.s3.amazonaws.com/latest/deb/gitlab-runner_amd64.deb" && dpkg -i gitlab-runner_amd64.deb

ENTRYPOINT ["/bin/bash"]

