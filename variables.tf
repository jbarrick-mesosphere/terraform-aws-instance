variable "region" {
  description = "Region to be used"
  default     = ""
}

variable "cluster_name" {
  description = "Cluster name all resources get named and tagged with"
}

# variable "availability_zones" {
#  description = "Specify the availability zones to be used"
#  type = "list"
# }

variable "tags" {
  description = "Custom tags added to the resources created by this module"
  type        = "map"
  default     = {}
}

variable "ami" {
  description = "AMI to be used"
}

variable "num" {
  description = "Number of instances to be created"
}

variable "instance_type" {
  description = "Instance type"
  default     = "m4.large"
}

variable "root_volume_size" {
  description = "Root volume size"
  default     = "40"
}

variable "root_volume_type" {
  description = "Root volume type. Masters MUST use at least gp2"
  default     = "gp2"
}

variable "subnet_ids" {
  description = "Subnets to spawn the instances in. The module tries to distribute the instances"
  type        = "list"
}

variable "security_group_ids" {
  description = "Firewall IDs to use for these instances"
  type        = "list"
}

variable "iam_instance_profile" {
  description = "Instance profile to be used for these instances"
  default     = ""
}

variable "associate_public_ip_address" {
  description = "Instance profile to be used for these instances"
  default     = true
}

variable "user_data" {
  description = "User data to be used on these instances (cloud-init)"
  default     = ""
}

// TODO: Maybe use a list instead and provision keys through cloudinit
variable "key_name" {
  description = "The SSH key to use for these instances."
}

variable "hostname_format" {
  description = "Format the hostname inputs are index+1, region, cluster_name"
  default     = "%[3]s-instance%[1]d-%[2]s"
}
