# exonet_wordpress

## Requirements

terraform >= 0.12
Ansible >= 2.8

## Commands

Start with:

```Makefile

    make start
```

Stop with:

```Makefile

    make stop

```

## Changing Terraform file path

To change the path of execution of the terraform insfrastructure, change the path in

## Future optimizations

If not t2-micro, consider EBS-optimizing the instances.

## Design Considerations

Rather than use ec2.py, ec.ini to fetch the inventory dynamically,
The inventory file is populated using a jq operation on the tfstate file

## Note

For easy management, all dynamically generated variables are generated in the role/common/tasks/set_vars directory.
