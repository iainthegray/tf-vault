module "avengers_namespace" {
  source = "github.com/iainthegray/vault_namespace_poc"
  token = var.token
  namespace_name = "avengers"
  vault_addr = var.vault_addr
  kv_path = var.kv_path
  use_kv = true
  use_policy = true
  policies = {
    "avengers_pol" = "${data.template_file.avengers_policy.rendered}"
    }
  use_ldap = true
  ns_group_name = "avengers"
  ext_group_id = vault_identity_group.avengers_group.id
}

/* Add all namespace based policies here. These are then added to the namespace
in the namespace module with the use of use_policy */
data "template_file" "avengers_policy" {
  template = "${file("${path.module}/policies/templates/namespace_policy.tpl")}"
}
/* Create an external group for the group that will be admins for
this namespace in LDAP */
resource "vault_identity_group" "avengers_group" {
  name     = "avengers_ext"
  type     = "external"
  policies = [ "shared_pol"]
}
resource "vault_identity_group_alias" "avengers-alias" {
  name           = "avengers"
  mount_accessor = vault_ldap_auth_backend.ldap.accessor
  canonical_id   = vault_identity_group.avengers_group.id
}
