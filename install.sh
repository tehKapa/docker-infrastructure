#!/bin/bash

cat << "EOF"

    ____             __                  __        ____         
   / __ \____  _____/ /_____  __________/ /_____ _/ / /__  _____
  / / / / __ \/ ___/ //_/ _ \/ ___/ ___/ __/ __ `/ / / _ \/ ___/
 / /_/ / /_/ / /__/ ,< /  __/ /  (__  ) /_/ /_/ / / /  __/ /    
/_____/\____/\___/_/|_|\___/_/  /____/\__/\__,_/_/_/\___/_/     
                                                                
EOF

sudo apt-get update && sudo apt-get upgrade -y

cat << "EOF"

###################################################
I have updated your system
###################################################

EOF

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    thin-provisioning-tools \
    lvm2
    
###################################################
Adding the new repository
###################################################    

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

cat << "EOF"

###################################################
Now, I install Docker
###################################################

EOF

sudo apt-get install docker-ce docker-ce-cli containerd.io -y # Install Docker CE Stable

sudo groupadd docker # Manage Docker as a non-root user

sudo usermod -aG docker $USER 

sudo systemctl enable docker

sudo docker version # Check Docker version

cat << "EOF"

###################################################
Tada! All fine. Welcome aboard, captain.
###################################################

EOF
