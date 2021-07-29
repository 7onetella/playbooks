#!/bin/bash -e

# set -x

usage() {
  echo -e "Usage   : deloy.sh"  
  echo
  echo -e 'Example : deloy.sh"'
  echo
}

export ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_ROLES_PATH=./roles:../roles

# if [ "${1}" = "" ]; then
#     usage
#     exit 0
# fi

echo
read -p "Enter node ip address       : " ip_address
ip_address=${ip_address:-192.168.0.111}

read -p "Enter ansible_user [debian] : " ansible_user
ansible_user=${ansible_user:-debian}

read -p "Enter email                 : " email
email=${email:-7onetella@gmail.com}

read -p "Enter api_key               : " api_key

cat ../hosts.tpl > hosts
echo "${ip_address}" >> hosts 

ansible-playbook -i hosts -e "ansible_user=${ansible_user} email=${email} api_key=${api_key}" certbot.yml    

rm -f hosts || true
