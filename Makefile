start:
	ansible-playbook site.yaml --tags "create" -vvv
		
stop:
	ansible-playbook site.yaml --tags "destroy" -vvv