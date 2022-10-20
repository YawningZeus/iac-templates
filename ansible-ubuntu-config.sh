ansible-ubuntu-config.sh

#create and configure ansible on ubuntu manchine

#vm-login
ssh  devuser@20.254.8.149
password x[MWC:KTk^t(T

#Make sure to login to VM and run this manually to finish configuring ansible on ubuntu VM
#first check python and pip3 versions
python -V; python3 -V; pip3 -V;

#then run below command
ansible --version 

#if running python version 3.8.0 skip this process and move to installing ansible modules.
#if lower run these commnds

#then execute below commands to point update default python to python3.8 
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 2
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 3
sudo update-alternatives --config python3

#running these commands will change the default python installed such as 2.7 and 3.6 to now point to python 3.8
#IMPORTANT NO OTHER JOBS OR WORKLOADS SHOULD BE DEPENDENT ON ANY OTHER VERSIONS. 

#then run below command to install ansible
sudo apt -y install ansible

#make sure ansible was installed correctly  
ansible --version

#upgrade pip for python 3
python3 -m pip install --upgrade pip

#upgrade pip for python 2
python2 -m pip install --upgrade pip

#then install azure ansible modules by running below commands to run ansible playbooks and create infastructure in azure

# Upgrade pip3.
sudo pip3 install --upgrade pip

# Install Ansible az collection for interacting with Azure.
ansible-galaxy collection install azure.azcollection

# Install Ansible modules for Azure
sudo pip3 install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements-azure.txt



#sudo pip3 install ansible[azure]
#wget https://raw.githubusercontent.com/ansible-collections/azure/dev/requirements-azure.txt
#sudo pip3 install -r requirements-azure.txt 

#if doesnt work and errors on build run galaxy 
#ansible-galaxy collection install azure.azcollection

#then install requirements.txt
#sudo pip3 install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements-azure.txt

#if ansible version lower than 2.11 make sure pip3 is installed 
#sudo apt install python3-pip

#If curl package is not installed on the system, install it with command apt-get or yum repository.
sudo apt-get install curl

#Before using azure ansible collection I need to authenticate to Microsoft Azure using ansible module. For this I am installing and using Az CLI application using below command.
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

#use az login command to login to Azure cloud, it will provide a link
az login

#if ansible version lower than 2.11 make sure pip3 is installed make sure pip3 references 3.8
pip3 -V

#if all checks make sure to update path to python 3.8 executable
export PATH="/home/devuser/.local/bin/:$PATH"

#once run should point to a version ansible 2.13 or higher 
ansible --version


#at the time of this writing, the pycrypto package (a collection of secure hash functions such as SHA256) does not get installed automatically with python3.7+
#to fix this, follow this instructions below reported on their github issue ticket page
#https://github.com/pycrypto/pycrypto/issues/298

#$ cd /usr/lib/python3/dist-packages/
#sudo wget https://ftp.dlitz.net/pub/dlitz/crypto/pycrypto/pycrypto-2.7a1.tar.gz 
#tar -zxvf pycrypto-2.7a1.tar.gz 
#mv Crypto Crypto_
#mv pycrypto-2.7a1 Crypto