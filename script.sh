#!/bin/bash

cd ./terraform
terraform init
terraform apply --auto-approve
sleep 150

Instance_Ip=$(terraform output -raw ec2_Ip)
ANSIBLE_HOSTS_FILE="../Roles/hosts"
{
  echo "[ec2_instance]"
  echo "$Instance_Ip"
  }  > "$ANSIBLE_HOSTS_FILE"
cd ../Roles
cat hosts

ansible-playbook -i hosts main.yaml

