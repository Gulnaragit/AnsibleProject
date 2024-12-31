# AnsibleProject

(((1. You need have terraform & ansible binaries installed in your bastion/local host:

    sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" -y
    sudo apt-get update
    sudo apt-get install terraform
    terraform --version

    sudo apt-get install ansible -y
    ansible --version

2. You bastion/local host needs to have appropriate IAM permissions.)))

# TO APPLY.

1. Change permission of bash script file "script.sh" to exucatable by running:
    chmod +x script.sh

2. Run bash script file "script.sh" form your homw directory by running:
    ./script.sh

# TO DELETE. 

1. Go to terraform directory:
    cd ~/AnsibleProject/terraform 

2. Run command:
    terraform destroy --auto-approve