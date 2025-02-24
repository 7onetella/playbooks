

# Prerequisite
This script assumes you have you have your inventory defined in /etc/ansible/hosts
```
[nomad_cluster]
node[1:3].example.com

[all:vars]
ansible_connection=ssh
ansible_user=vagrant
ansible_port=22
ansible_private_key_file=~/.ssh/id_rsa
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
```

# Run the playbook with deploy.sh
`nomad-cluster.yml` playbook expects three node cluster. Enter FQDN node host names.
```
$ ./deploy.sh nomad_cluster

Enter consul node1 hostname: node1.example.com
Enter consul node2 hostname: node2.example.com
Enter consul node3 hostname: node3.example.com

Enter nomad node1 hostname: node4.example.com
Enter nomad node2 hostname: node5.example.com
Enter nomad node3 hostname: node6.example.com

Enter ansible_user [vagrant]: 

PLAY [consul cluster] *************************************************

TASK [Gathering Facts ]************************************************
...
```