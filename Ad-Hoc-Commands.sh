#!/bin/bash
ansible -i host_ansible clients -m shell -a "who"
ansible -i host_ansible clients -m shell -a "netstat -a"
ansible -i host_ansible clients -m shell -a "df -h"
ansible -i host_ansible clients -m shell -a uptime
ansible -i host_ansible clients -m user -a "name=testuser1 state=present"
ansible -i host_ansible clients -a "cat /etc/passwd"
ansible -i host_ansible clients -m file -a "path=/tmp/testfile1 state=touch"
ansible -i host_ansible clients -m shell -a "ls /tmp/"
ansible -i host_ansible clients -m ping -f 1 # -f here is fork which specifies to perform the operation for the give number of clients.
ansible -i host_ansible client1 -m setup # gets the Setup module's gathered facts
ansible client1 -m ansible.builtin.setup
ansible -i hosts 'all!:app' -a free
ansible -i hosts web[0:3] -a free
ansible -i hosts web:app -a free 
ansible -i hosts 'all:!db' -a "free -m"
ansible -i hosts 'all:!db1' -a "free -m" # excluding db1
ansible -i project1/hosts all -a free # seperate host files per project
ansible -i hosts 'all:&inter' -a "free -m" # intersection
ansible -i hosts 'app:db:web:!localhost' -a "free -m" # except localhost
ansible-playbook -i hosts nginx2.yaml --check --tags tools
ansible-playbook -i hosts nginx3.yaml --tags apt,nginxtask
ansible-playbook -i hosts nginx3.yaml --tags tools && ansible-playbook -i hosts nginx3.yaml --tags nginx
cat /tmp/factsjson/app1 | jq ".ansible_date_time[]" | tr -d '"'