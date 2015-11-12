create-client-keys:
	./create_client_keys.sh

configure-ssh-trust:
	./configure_ssh_trust.sh $(key)

configure-ssh-config:
	./configure_ssh_config.sh $(key)

add-key:
	./add_key.sh $(key)

remove-key:
	./remove_key.sh $(match)

change-passphrase:
	ssh-keygen -p -f $(key)
