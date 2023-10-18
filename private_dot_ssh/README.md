# ssh

## access
* .ssh directory: 700 (drwx------)
* public key ( .pub files): 644 (-rw-r--r--)
* private key ( id_rsa ): 600 (-rw-------)

> If you do not set the rights or set others, the connection via ssh will not happen

# Management

Managed by [chezmoi](https://github.com/twpayne/chezmoi)

Templates are used to generate keys from 1Password. Script `run_once_after_set_permissions.sh` is used to set permissions for keys.