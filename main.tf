resource "openstack_compute_instance_v2" "instance" {
  count = "${var.instance_count}"
  name = format("%s-%02d", var.openstack_instance_name_prefix, count.index + 1)
  flavor_name = data.openstack_compute_flavor_v2.flavor[count.index].name
  key_pair = var.openstack_key_name
  network {
    name = "private"
  }
  block_device {
  boot_index = 0 
  delete_on_termination = true
  destination_type = "volume"
  source_type = "volume"
  uuid = openstack_blockstorage_volume_v3.os_block[count.index].id
  }
  metadata = {
    imageName = "${var.openstack_image_names[count.index]}"
  }
  user_data = "#cloud-config\nchpasswd:\n  list: |\n    root:password\n"
}

resource "openstack_blockstorage_volume_v3" "os_block"{
  count = "${var.instance_count}"
  name = "${var.openstack_instance_name_prefix}-block-${count.index + 1}"
  size = "${var.os_disk_size[count.index]}"
  enable_online_resize = true
  image_id = data.openstack_images_image_v2.image[count.index].name
  timeouts {
    create = "60m"
    delete = "30m"
  }
}

data "openstack_images_image_v2" "image" {
  count = "${var.instance_count}"
  name = "${var.openstack_image_names[count.index]}"
  most_recent = true
}

data "openstack_compute_flavor_v2" "flavor" {
  count = "${var.instance_count}"
  name = "${var.openstack_flavor_names[count.index]}"
}

data "openstack_networking_port_v2" "port" {
  count = "${var.instance_count}"
  device_id = openstack_compute_instance_v2.instance[count.index].id
}
