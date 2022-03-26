# TEST CODE QUALITY WITH YAMLLINT TOOL
yamllint -c yamllint_rules.yml .

# INSTALL ANSIBLE-GALAXY REQUIRMENTS
ansible-galaxy collection install -r requirments.yml

# RUN PLAYBOOK
ansible-playbook -i inventory main.yml --user=ubuntu