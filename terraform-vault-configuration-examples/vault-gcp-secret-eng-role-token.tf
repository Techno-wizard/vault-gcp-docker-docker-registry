# docker reposiaty push and pull access
# orignal file: non
resource "vault_gcp_secret_roleset" "docker-repo-push-pull-token" {
	backend			= "${vault_gcp_secret_backend.gcp.path}"
	roleset			= "docker-repo-push-pull-token"
	secret_type		= "access_token"
	project			= "${local.docker_repo_project}"
	token_scopes	= ["https://www.googleapis.com/auth/cloud-platform"]
	binding {
		resource	= "${local.docker_repo_proj_resource}"
  		roles 		= ["roles/storage.admin",]
	}
}

# docker reposiaty pull access
# orignal file: non
resource "vault_gcp_secret_roleset" "docker-repo-pull-token" {
	backend			= "${vault_gcp_secret_backend.gcp.path}"
	roleset			= "docker-repo-pull-token"
	secret_type		= "access_token"
	project			= "${local.docker_repo_project}"
	token_scopes	= ["https://www.googleapis.com/auth/cloud-platform"]
	binding {
		resource	= "${local.docker_repo_proj_resource}"
  		roles 		= ["roles/storage.objectViewer",]
	}
}
