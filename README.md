# minikube-docker-rockylinux8 (Note donot Run Minikube as root user instead create a standard sudo user before using this script)
This is a basic script to install docker minikube and kubertentes
Once the Script ends Logout SSH session  then use the belw two commands to start minikube 

minikube config set driver docker

minikube start --driver=docker
