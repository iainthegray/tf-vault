module "shared_namespace" {
  source = "github.com/iainthegray/vault_namespace_poc"
  token = var.token
  namespace_name = "shared"
  vault_addr = var.vault_addr
  kv_path = var.kv_path
  use_kv = true
}

/* no namespace policies -- as this is ashared namespace all policies
are at the root level */
data "template_file" "shared_policy" {
  template = "${file("${path.module}/policies/templates/shared_policy.tpl")}"
  vars = {
    namespace_name = "shared"
  }
}
resource "vault_policy" "shared_pol" {
  name   = "shared_pol"
  policy = data.template_file.shared_policy.rendered
}
