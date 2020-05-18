path "secrets/*" {
   capabilities = ["create", "read", "update", "delete", "list"]
}
path "sys/internal/ui/mounts" {
    capabilities = ["read"]
}
path "*" {
   capabilities = ["read", "list"]
}
path "/" {
   capabilities = ["read", "list"]
}
path "sys/capabilities-self" {
  capabilities = ["update"]
}
