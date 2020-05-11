/* The Avengers Namespace */
module "avengers_namespace" {
  source = "github.com/iainthegray/vault_namespace_poc"
  token = var.token
  namespace_name = "avengers"
  vault_addr = var.vault_addr
  kv_path = var.kv_path
  use_userpass = false
  use_kv = true
}
resource "vault_ldap_auth_backend_group" "avengers" {
    groupname = "avengers"
    policies  = ["avengers_pol"]
    backend   = "${vault_ldap_auth_backend.ldap.path}"
}

/* Avengers policy */
data "template_file" "avengers_policy" {
  template = "${file("${path.module}/policies/templates/namespace_policy.tpl")}"

  vars = {
    namespace_name = "avengers"
  }
}

resource "vault_policy" "avengers" {
  name   = "avengers_pol"
  policy = "${data.template_file.avengers_policy.rendered}"
}
