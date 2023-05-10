locals {
subscription_id = get_env("ARM_SUBSCRIPTION_ID")  #passed from pipeline via env variable
location_short  = "weu"
location        = "westeurope"
project         = "usec"
stage           = "dev"
context         = "trg"
instance        = "002"
}