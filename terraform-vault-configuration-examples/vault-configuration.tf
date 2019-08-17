provider "vault" {
	version = "~> 2.2.0"
	# This will default to using $VAULT_ADDR
	# address = "https://url to vault server:8200"

	# Will look for environment variable VAULT_TOKEN or file .vault-token if not set
	# token = "${file("token in a file")}"
}
