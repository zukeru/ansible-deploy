#!/bin/bash
apt-get update --force-yes
apt-get install software-properties-common -y --force-yes
apt-add-repository ppa:ansible/ansible -y --force-yes
apt-get update -y --force-yes
apt-get install ansible -y --force-yes
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa 
ssh-copy-id root@107.155.88.20
echo "[myhosts]
localhost ansible_connection=local
107.155.88.20 ansible_connection=ssh ansible_ssh_user=root" > /etc/ansible/hosts
ansible all -a "apt-get install python-pip -y --force-yes"
ansible all -a "apt-get install python-apt -y --force-yes"

