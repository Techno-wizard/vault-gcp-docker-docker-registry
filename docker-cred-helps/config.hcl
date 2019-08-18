auto_auth {
        method "approle" {
                mount_path = "auth/approle"
                config     = {
                        secret              = "secret/application/docker"
                        role_id_file_path   = "/tmp/test-vault-role-id"
                        secret_id_file_path = "/tmp/test-vault-secret-id"
                        vault_addr          = "http://127.0.0.1:8200"
                }
        }

        sink "file" {
                config = {
                        path = "/tmp/token-sink"
                }
        }
}
