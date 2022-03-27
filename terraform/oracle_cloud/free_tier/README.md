# TEST CODE QUALITY WITH YAMLLINT TOOL
yamllint -c yamllint_rules.yml .

# INSTALL ANSIBLE-GALAXY REQUIRMENTS
ansible-galaxy collection install -r requirments.yml

# RUN PLAYBOOK
ansible-playbook -i inventory common_base_config.yml --user=ubuntu
ansible-playbook -i inventory kubernetes_cluster.yml