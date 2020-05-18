path "${namespace_name}/secrets/*" {
   capabilities = ["read", "list"]
}
path "sys/capabilities-self" {
  capabilities = ["update"]
}
path "shared/sys/capabilities-self" {
  capabilities = ["update"]
}
