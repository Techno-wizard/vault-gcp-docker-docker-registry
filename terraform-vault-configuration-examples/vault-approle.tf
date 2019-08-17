resource "vault_approle_auth_backend_role" "docker-read" {
	backend		= "${vault_auth_backend.approle.path}"
	role_name		= "docker-read"
	token_ttl		= 1200
	policies		= ["default", "docker-read-from-vault"]
}

resource "vault_approle_auth_backend_role" "devops-group" {
	backend			= "${vault_auth_backend.approle.path}"
	role_name		= "devops-group"
	token_ttl		= 1200
	policies		= ["default", "docker-read-from-vault", "create-docker-repo-push-pull-access"]
}

resource "vault_approle_auth_backend_role" "pull_gcp_repo" {
	backend			= "${vault_auth_backend.approle.path}"
	role_name		= "pull_gcp_repo"
	token_ttl		= 1200
	policies		= ["default", "create-docker-repo-pull-access"]
}

