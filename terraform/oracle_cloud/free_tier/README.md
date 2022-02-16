
base config run 
ansible-playbook -i inventory base_config.yml --user=ubuntu


pihole config:
ansible-playbook -i inventory pihole.yml --ask-vault-pass