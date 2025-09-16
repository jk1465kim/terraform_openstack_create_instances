variable "openstack_image_name" {
  type = string
  default = ""
}

variable "openstack_image_names" {
  type = list(string)
  description = "List of Image names by index"
  default = []
}

variable "openstack_flavor_name" {
  type = string
  default = ""
}

variable "openstack_flavor_names" {
  type = list(string)
}

variable "openstack_instance_name_prefix" {
  type = string
}

variable "openstack_key_name" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "os_disk_size" {
  type = list(number)
  description = "List of size by index"
  default = []
}

