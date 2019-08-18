#
GCP_DOCKER_PULL_ROLE_ID=$(vault read -field=role_id auth/approle/role/pull_gcp_repo/role-id)
echo ${GCP_DOCKER_PULL_ROLE_ID} > /tmp/test-vault-role-id
GCP_DOCKER_PULL_SECRET_ID=$(vault write -f -field=secret_id auth/approle/role/pull_gcp_repo/secret-id)
echo ${GCP_DOCKER_PULL_SECRET_ID} > /tmp/test-vault-secret-id
#
VAULT_LOGIN=$(curl --request POST --data '{"role_id":"'${GCP_DOCKER_PULL_ROLE_ID}'","secret_id":"'${GCP_DOCKER_PULL_SECRET_ID}'"}' ${VAULT_ADDR}/v1/auth/approle/login)
VAULT_TOKEN=$(echo ${VAULT_LOGIN} | jq -r '.auth.client_token')
OAUTH_REQUEST=$(curl --header "X-Vault-Token: "${VAULT_TOKEN}"" ${VAULT_ADDR}/v1/gcp/token/docker-repo-pull-token)
OAUTH_TOKEN=$(echo ${OAUTH_REQUEST} | jq -r '.data.token')
echo ${OAUTH_TOKEN}
FULL_DATA=$(curl --header "X-Vault-Token: "${VAULT_TOKEN}"" ${VAULT_ADDR}/v1/secret/application/docker)
OLD_AUTH=$(echo ${FULL_DATA} | jq -r '.data')
NEW_AUTH=$(echo ${OLD_AUTH} | jq '.password = "'${OAUTH_TOKEN}'"')
curl --header "X-Vault-Token: "${VAULT_TOKEN}"" --request POST --data "${NEW_AUTH}" ${VAULT_ADDR}/v1/secret/application/docker
#docker login http://eu.gcr.io
docker pull eu.gcr.io/ops-identity-test/terraform-make:v02
