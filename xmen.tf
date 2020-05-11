/* The Xmen Namespace */
module "xmen_namespace" {
  source = "github.com/iainthegray/vault_namespace_poc"
  token = var.token
  namespace_name = "xmen"
  vault_addr = var.vault_addr
  kv_path = var.kv_path
  use_userpass = false
  use_kv = true
}
resource "vault_ldap_auth_backend_group" "xmen" {
    groupname = "xmen"
    policies  = ["xmen_pol"]
    backend   = "${vault_ldap_auth_backend.ldap.path}"
}

/* Xmen policy */
data "template_file" "xmen_policy" {
  template = "${file("${path.module}/policies/templates/namespace_policy.tpl")}"

  vars = {
    namespace_name = "xmen"
  }
}

resource "vault_policy" "xmen" {
  name   = "xmen_pol"
  policy = "${data.template_file.xmen_policy.rendered}"
}
