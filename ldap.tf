# Create ldap auth in root
resource "vault_ldap_auth_backend" "ldap" {
    path        = "ldap"
    url         = "ldap://10.0.1.100"
    insecure_tls = true
    starttls     = false
    binddn      = "uid=vault,ou=People,dc=foo,dc=com"
    bindpass    = "password"
    groupattr   = "memberOf"
    groupdn     = "ou=People,dc=foo,dc=com"
    userattr    = "uid"
    userdn      = "ou=People,dc=foo,dc=com"
    groupfilter = "(&(objectClass=inetOrgPerson)(uid={{.Username}}))"
}
