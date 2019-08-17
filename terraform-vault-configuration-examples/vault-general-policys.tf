# Add vault policies that can be applict to many types of user

# allowed to read from vault key vaule store (kv)
resource "vault_policy" "docker-read-from-vault" {
	name = "docker-read-from-vault"
	policy = "${file("./general-docker-read-from-vault.hcl")}"
}

# Generte GCP Docker service account key or oauth token
# allowed to push or pull from GCP Repo
resource "vault_policy" "create-docker-repo-push-pull-access" {
	name = "create-docker-repo-push-pull-access"
	policy = "${file("./general-docker-repo-push-pull-policy.hcl")}"
}

# Generte GCP Docker service account key or oauth token
# allowed to pull only form GCP Repo
resource "vault_policy" "create-docker-repo-pull-access" {
	name = "create-docker-repo-pull-access"
	policy = "${file("./general-docker-repo-pull-policy.hcl")}"
}
