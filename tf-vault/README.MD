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

No real usage here as this is really just an example repo
## Variables
token = The vault token to use. Though Terraform will take the VAULT_TOKEN envar
