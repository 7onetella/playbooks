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
ip_address=${ip_address:-192.168.69.103}

echo
read -p "Enter ansible_user [debian] : " ansible_user
ansible_user=${ansible_user:-debian}


cat ./hosts.tpl > hosts
echo "${ip_address}" >> hosts 

ansible-playbook -i hosts -e "target=nodes ansible_user=${ansible_user}" k3s.yml    

rm -f hosts || true
