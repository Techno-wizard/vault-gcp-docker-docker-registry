resource "vault_mount" "kv_secret" {
	path        				= "secret"
	type        				= "kv"
	description 				= "Key Value store mount"
	# Default lease duration for tokens and secrets in seconds
	default_lease_ttl_seconds	= 3600
	# Maximum possible lease duration for tokens and secrets in seconds
	max_lease_ttl_seconds		= 86400
}