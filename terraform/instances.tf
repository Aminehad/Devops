data "openstack_images_image_v2" "image" {
  name = "Official-debian-11 "
  tags = ["latest"]
}

resource "openstack_compute_instance_v2" "my-instance" {
  name = "instance-2"
  image_id = data.openstack_images_image_v2.image.id
  flavor_name = "v1.m1.d10"
  security_groups = ["default"]

    network {
        name= openstack_networking_network_v2.network[0].name
    }

    user_data = file("./conf.yaml")

}
resource "openstack_networking_floatingip_v2" "fip_1" {
  pool = "public"
}

resource "openstack_compute_floatingip_associate_v2" "fip_1" {
  floating_ip = openstack_networking_floatingip_v2.fip_1.address
  instance_id = openstack_compute_instance_v2.my-instance.id
}