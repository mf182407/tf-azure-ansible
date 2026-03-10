# tf-azure-ansible
?This repo will deploy a new resource group specific for ansible, a linux vm in azure, in order to run ansible.

## Manual Prerequisite:
### Azure
```bash
create subscriptions for environments needed
create a resource group for tfstate data
create a storage account for tfstate data
create a blob container for tfstate data