path "shared/shared_secrets/*" {
   capabilities = ["read", "list"]
}
path "sys/internal/ui/mounts" {
    capabilities = ["read"]
}
path "shared/sys/capabilities-self" {
  capabilities = ["update"]
}
