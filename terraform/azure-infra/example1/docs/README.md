 # Infrastructure overview:
- Logging to VM bastion only with ssh keys which are randomly generated during deployment. Stored in file "id_rsa" at the end of deployment.
- Bation VM has public IP address assigned during deployment
- On prod VMs apache in installed with custom webpage
- Load balancer passess traffic to one of prod VMs
- SSH logging to prod VMs only from Bastion host with password defined in vars.tf file 

Network rules:
- All trafic to Bastion VM is blocked except ssh on port 22
- Only following traffic is allowed to prod subnet:
    * On port 22 from bastion subnet
    * Any port from Azure Load balancer (for performing heatth check etc.)
    * HTTP traffic on port 80 from "Intenret" (Load Balancer passes requestor source IP address)
- All other traffic to prod subnet is blocked

![alt test]( https://github.com/przemekgorzynski/infrastructure_as_code/blob/master/terraform/azure-infra/example1/docs/Azure.png )


# Execution

Before runnig update provider_credential.tf file with Azure service principal credentials.
Those credentials can be generated with following command:

    az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/SUBSCRIPTION_ID"

If necessary update vars.tf file with your values. 

Commands:
      
    terraform plan
    terraform apply

At the end of deployment following data are returned in console:

    Admin_user = "admuser"  (Defined in vars.tf file)
    Admin_user_password = Login Password for admin defined in vars.tf file
    FQDN = "custom-webpage-pg.westeurope.cloudapp.azure.com"  (Custom Domain defined in vars.tf file)
    Bastion_IP = "40.68.13.4"
    LB_IP = "40.114.253.194"

# Validation

Go to Loab balancer IP address ( or FQDN ) and webpage is displayed.

![alt test]( https://github.com/przemekgorzynski/infrastructure_as_code/blob/master/terraform/azure-infra/example1/docs/webpage.png )

![alt test]( https://github.com/przemekgorzynski/infrastructure_as_code/blob/master/terraform/azure-infra/example1/docs/fqdn.png )