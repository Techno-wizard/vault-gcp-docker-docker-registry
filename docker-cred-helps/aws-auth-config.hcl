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
