# Allow to read docker auth from vault
# Read - secret

path "secret/application/docker"
{
  capabilities = ["update", "read", "list"]
}
