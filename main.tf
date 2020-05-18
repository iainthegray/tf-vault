terraform {
  required_providers {
    template  = "~> 2.1"
    vault = "~> 2.10"
  }
}
provider "vault" {
  address = var.vault_addr
  token = var.token
}
/* Root Namespace Policy */
data "template_file" "root_policy" {
  template = "${file("${path.module}/policies/templates/root_namespace_policy.tpl")}"
}
resource "vault_policy" "root_pol" {
  name   = "root_pol"
  policy = data.template_file.root_policy.rendered
}
