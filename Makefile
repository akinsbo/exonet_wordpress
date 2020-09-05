start:
	# ansible-playbook site.yaml --ask-become-pass --tags "create" -vvv
	ansible-playbook site.yaml  --ask-become-pass --extra-vars "infra_action=create" -vvvv --vault-password-file .secrets/.vault_pass.txt


stop:
	ansible-playbook site.yaml --extra-vars "infra_action=destroy" -vvvv --vault-password-file .secrets/.vault_pass.txt

test:
	ansible-playbook test.yaml --ask-become-pass --extra-vars "infra_action=create" -vvvv --vault-password-file .secrets/.vault_pass.txt

test2:
	ansible-playbook test2.yaml --extra-vars "infra_action=create" -vvvv --vault-password-file .secrets/.vault_pass.txt

docker:
	ansible-playbook docker.yaml -vvvv --ask-become-pass --vault-password-file .secrets/.vault_pass.txt