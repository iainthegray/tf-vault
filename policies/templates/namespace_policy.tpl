# Ability on the secrets
path "${namespace_name}/secrets/*" {
   capabilities = ["create", "read", "update", "delete", "list"]
}
path "shared/shared_secrets/*" {
   capabilities = ["read", "list"]
}
path "sys/internal/ui/mounts" {
    capabilities = ["read"]
}
path "${namespace_name}/*" {
   capabilities = ["read", "list"]
}
path "${namespace_name}/" {
   capabilities = ["read", "list"]
}
# Policies for UI
path "${namespace_name}/sys/capabilities-self" {
  capabilities = ["update"]
}
path "shared/sys/capabilities-self" {
  capabilities = ["update"]
}
