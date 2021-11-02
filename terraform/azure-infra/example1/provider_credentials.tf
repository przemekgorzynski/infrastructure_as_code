# Authorization
# Generate with: az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/SUBSCRIPTION_ID"
variable "service_principal_appid" { 
    default =  "VALUE"
}

variable "azure_subscription_tenant_id" {
     default =  "VALUE"
}
variable "azure_subscription_id" {
     default =  "VALUE"
}

variable "service_principal_password" {
     default =  "VALUE"
}