# docker reposiaty push and pull access
# orignal file: non
resource "vault_gcp_secret_roleset" "docker-repo-push-pull" {
	backend		= "${vault_gcp_secret_backend.gcp.path}"
	roleset		= "docker-repo-push-pull"
	secret_type	= "service_account_key"
	project		= "${local.docker_repo_project}"
	binding {
		resource	= "${local.docker_repo_proj_resource}"
  		roles 		= ["roles/storage.admin",]
	}
}

# docker reposiaty pull access
# orignal file: non
resource "vault_gcp_secret_roleset" "docker-repo-pull" {
	backend		= "${vault_gcp_secret_backend.gcp.path}"
	roleset		= "docker-repo-pull"
	secret_type	= "service_account_key"
	project		= "${local.docker_repo_project}"
	binding {
		resource	= "${local.docker_repo_proj_resource}"
  		roles 		= ["roles/storage.objectViewer",]
	}
}
