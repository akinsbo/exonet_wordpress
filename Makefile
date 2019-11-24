start:
	# ansible-playbook site.yaml --ask-become-pass --tags "create" -vvv
	ansible-playbook site.yaml --tags "create" -vvvv

stop:
	ansible-playbook site.yaml --tags "destroy" -vvv