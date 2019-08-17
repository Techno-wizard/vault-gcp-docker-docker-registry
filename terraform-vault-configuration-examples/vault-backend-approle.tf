# approle standard back end
resource "vault_auth_backend" "approle" {
	type		= "approle"
}
