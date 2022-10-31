#!/usr/bin/env bash
echo updating system
sleep 2s
dnf update -y
echo addinf docker repo
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
echo installing docker 
sleep 2s
sudo dnf install docker-ce docker-ce-cli containerd.io -y
sudo systemctl start docker
sudo systemctl enable docker
echo adding docker Access without Sudo 
sudo usermod -aG docker $(whoami)
echo adding Kubectl repository 
cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
sleep 5s 
echo installing Kubectl
sudo dnf install -y kubectl
echo downloading minikube 
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm
sudo rpm -Uvh minikube-latest.x86_64.rpm
echo logout from SSH session and type the below command after login in  
echo minikube config set driver docker
echo minikube start --driver=docker
