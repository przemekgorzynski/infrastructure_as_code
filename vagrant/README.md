Vagrant installation
1. Install VirtualBox and vagrant
2. Install VirtualBox extension Pack
3. Install vagrant plugin ->  vagrant plugin install vagrant-vbguest
4. Install vagrant disk plugin -> vagrant plugin install vagrant-disksize


VM OPTIONS:

* vagrant_simple_machine - runs single instance on Centos7  
* vagrant_multiple_machines - runs multiple machines with the same configuration   
* vagrant_multiple_machines_v2 - runs multiple machines with different configuration   
Deployment of some extra packages is done automatically using Ansible during execution
