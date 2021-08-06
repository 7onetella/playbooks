#!/bin/bash -e

# set -x

usage() {
  echo -e "Usage   : deloy.sh [<setup_option>]"  
  echo
  echo -e 'Example : deloy.sh consul"'
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
ip_address=${ip_address:-192.168.0.115}

echo
read -p "Enter ansible_user [debian] : " ansible_user
ansible_user=${ansible_user:-debian}

cat ../hosts.tpl > hosts
echo "${ip_address}" >> hosts 

if [ "${1}" == "consul" ]; then
  echo
  read -p "Enter consul node1 hostname : " consul_node1
  read -p "Enter consul node2 hostname : " consul_node2
  read -p "Enter consul node3 hostname : " consul_node3
  echo
fi

ansible-playbook -i hosts -e "setup_option=${1} ansible_user=${ansible_user} consul_node1=${consul_node1} consul_node2=${consul_node2} consul_node3=${consul_node3}" grafana.yml    

rm -f hosts || true