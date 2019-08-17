# Allow docker to read secrets in vault
# Read - secret

path "secret/*"
{
  capabilities = ["read"]
}
