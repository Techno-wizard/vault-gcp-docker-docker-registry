# vault-gcp-docker-docker-registry

On going code and ideas to allow authetication to a GCP Docker registry using Hashicorp 
vault.


command line to checl that a pull toke is genetaed 

vault read gcp/token/docker-repo-pull-token

vault read secret/application/docker

vault read -field=role_id auth/approle/role/pull_gcp_repo/role-id > /tmp/test-vault-role-id

vault write -f -field=secret_id auth/approle/role/pull_gcp_repo/secret-id > /tmp/test-vault-secret-id


Using 

https://github.com/morningconsult/docker-credential-vault-login


Add poc bash script pull the gcp toiken cread from vault write it back to the vault 
docker login.

assuming vault cread help setup work local.

