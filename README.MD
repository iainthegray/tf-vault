# Vault Provisioning with Terraform

This repo contains a very terraform for setting up a vault instance with namespaces and LDAP authentication.

It utilises the vault_namespace_poc which is a (very) simple namespace module
https://github.com/iainthegray/vault_namespace_poc

The LDAP setup is set for use with this OpenLDAP vagrant box I did which is here:
https://github.com/iainthegray/vagrant-ldap

## Versions
This repo was written using these versions:
-  terraform v0.12.24
-  vault provider v2.10.0
## Usage

The layout is create a namespace tf file for each new namespace. The bulk of the namespace creation is done in the namespace module. The only additional thing here is to add any policies to be added to the namespace and to add the external group and alias for LDAP group mapping
## Variables
token = The vault token to use. Though Terraform will take the VAULT_TOKEN envar
