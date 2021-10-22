
Before runnig configuration set following variables in vars.tf
- service_principal_password - password for Azure service principal user
- username-password - password for ssh between azure bastion and azure prod VMs

Logging to VM bastion only with using ssh keys which are randomly generated during deployment (private key displayed at the end of deployment)

![alt test]( https://github.com/przemekgorzynski/infrastructure_as_code/blob/master/terraform/azure-infra/example1/docs/Azure.png )
