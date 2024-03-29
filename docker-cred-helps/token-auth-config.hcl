#If you've set your token in the environment, you do not need to provide it in the configuration file.
#export VAULT_TOKEN="8efc06ef-ced9-170f-9f66-c94740a61c93"

auto_auth {
	method "token" {
		mount_path = "auth/token"
		config = {
			secret = "secret/application/docker"
			vault_add = "http://127.0.0.1:8200"
		}
        }

        sink "file" {
                config = {
                        path = "/tmp/token-sink"
                }
        }
}
