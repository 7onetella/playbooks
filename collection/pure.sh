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
ip_address=${ip_address:-192.168.4.107}

echo
read -p "Enter ansible_user [debian] : " ansible_user
ansible_user=${ansible_user:-debian}

echo
read -p "Enter username     [debian] : " username
username=${username:-debian}

cat ./hosts.tpl > hosts
echo "${ip_address}" >> hosts 

ansible-playbook -i hosts -e "target=nodes username=${username} ansible_user=${ansible_user}" pure.yml    

rm -f hosts || true
