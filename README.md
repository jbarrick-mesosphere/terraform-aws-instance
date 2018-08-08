AWS Instance
============
This is an module to creates a DC/OS AWS Instance.

If `ami` variable is not set. This module uses the mesosphere suggested OS
which also includes all prerequisites.

Using you own AMI
-----------------
If you choose to use your own AMI please make sure the DC/OS related
prerequisites are met. Take a look at https://docs.mesosphere.com/1.11/installing/ent/custom/system-requirements/install-docker-RHEL/

EXAMPLE
-------

```hcl
module "dcos-master-instance" {
  source  = "terraform-dcos/instance/aws"
  version = "~> 0.1"

  cluster_name = "production"
  subnet_ids = ["subnet-12345678"]
  security_group_ids = ["sg-12345678"]
  hostname_format = "%[3]s-master%[1]d-%[2]s"
  ami = "ami-12345678"
}
```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ami | AMI to be used | string | - | yes |
| associate_public_ip_address | Instance profile to be used for these instances | string | `true` | no |
| cluster_name | Cluster name all resources get named and tagged with | string | - | yes |
| hostname_format | Format the hostname inputs are index+1, region, cluster_name | string | `%[3]s-instance%[1]d-%[2]s` | no |
| iam_instance_profile | Instance profile to be used for these instances | string | `` | no |
| instance_type | Instance type | string | `m4.large` | no |
| key_name | The SSH key to use for these instances. | string | - | yes |
| num | Number of instances to be created | string | - | yes |
| region | Region to be used | string | `` | no |
| root_volume_size | Root volume size | string | `40` | no |
| root_volume_type | Root volume type. Masters MUST use at least gp2 | string | `gp2` | no |
| security_group_ids | Firewall IDs to use for these instances | list | - | yes |
| subnet_ids | Subnets to spawn the instances in. The module tries to distribute the instances | list | - | yes |
| tags | Custom tags added to the resources created by this module | map | `<map>` | no |
| user_data | User data to be used on these instances (cloud-init) | string | `` | no |

## Outputs

| Name | Description |
|------|-------------|
| instances | List of instances IDs created by this module |
| private_ips | List of private ip addresses created by this module |
| public_ips | List of public ip addresses created by this module |

