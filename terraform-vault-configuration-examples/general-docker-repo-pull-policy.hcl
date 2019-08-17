# gentate gcp docker repo pull only service account key
path "gcp/key/docker-repo-pull"
{
	capabilities = ["read"]
}

# gentate gcp docker repo pull only oauth token
path "gcp/token/docker-repo-pull-token"
{
	capabilities = ["read"]
}