
/* A shared Namespace*/
module "shared_namespace" {
  source = "github.com/iainthegray/vault_namespace_poc"
  token = var.token
  namespace_name = "shared"
  vault_addr = var.vault_addr
  kv_path = "shared_secrets"
  use_userpass = false
  use_kv = true
}

/* Shared policy */
data "template_file" "shared_policy" {
  template = "${file("${path.module}/policies/templates/shared_policy.tpl")}"

  vars = {
    namespace_name = "shared"
  }
}

resource "vault_policy" "shared" {
  name   = "shared_policy"
  policy = "${data.template_file.shared_policy.rendered}"
}
