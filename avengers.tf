module "avengers_namespace" {
  source = "./modules/vault_namespace_poc"
  token = var.token
  namespace_name = "avengers"
  vault_addr = var.vault_addr
  policies = {
    "avengers_pol" = "${data.template_file.avengers_policy.rendered}"
    "avengers_admin_pol" = "${data.template_file.avengers_admin_policy.rendered}"
    }
  int_groups = {
    "avengers" = vault_identity_group.avengers_group.id
    "avengers-admin" = vault_identity_group.avengers_admin_group.id
  }
  policy_map = {
    "avengers_pol" = vault_identity_group.avengers_group.id
    "avengers_admin_pol" = vault_identity_group.avengers_admin_group.id
  }
}

/* Add all namespace based policies here. These are then added to the namespace
in the namespace module with the use of use_policy */
data "template_file" "avengers_policy" {
  template = "${file("${path.module}/policies/templates/namespace_policy.tpl")}"
}
data "template_file" "avengers_admin_policy" {
  template = "${file("${path.module}/policies/templates/namespace_policy.tpl")}"
}
/* Create an external group for the group that will be admins for
this namespace in LDAP */
resource "vault_identity_group" "avengers_group" {
  name     = "avengers_ext"
  type     = "external"
  policies = [ ""]
}
resource "vault_identity_group" "avengers_admin_group" {
  name     = "avengers_admin_ext"
  type     = "external"
  policies = [ ""]
}

resource "vault_identity_group_alias" "avengers-alias" {
  name           = "avengers"
  mount_accessor = vault_ldap_auth_backend.ldap.accessor
  canonical_id   = vault_identity_group.avengers_group.id
}

resource "vault_identity_group_alias" "avengers-admin-alias" {
  name           = "avengers-admin"
  mount_accessor = vault_ldap_auth_backend.ldap.accessor
  canonical_id   = vault_identity_group.avengers_admin_group.id
}
