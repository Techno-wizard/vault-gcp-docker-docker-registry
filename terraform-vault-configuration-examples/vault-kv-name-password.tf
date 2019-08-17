resource "vault_generic_secret" "secret_application_docker" {
	depends_on = ["vault_mount.kv_secret"]
	
	path = "secret/application/docker"
	data_json = <<EOT
{
 	"username": "testuser",
 	"password": "testpassword"
}
EOT

}