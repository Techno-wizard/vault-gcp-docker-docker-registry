# gcp gcp backend
resource "vault_gcp_secret_backend" "gcp" {
	path						= "gcp"
	credentials					= "${file("./gcp-cred.json")}"
	description					= "Allow dynamic keys and token to be create in gcp.org by vault"
	default_lease_ttl_seconds	= 3600
	max_lease_ttl_seconds		= 86400
}
