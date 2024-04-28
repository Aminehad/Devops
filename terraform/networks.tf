data "openstack_networking_network_v2" "public" {
  name = "public"
}

# Router for the whole project, linked to the public network
resource "openstack_networking_router_v2" "global" {
  name                = "global"
  admin_state_up      = true
  external_network_id = data.openstack_networking_network_v2.public.id
}

# Internal Network
resource "openstack_networking_network_v2" "network" {
  name           = "my-network${count.index}"
  admin_state_up = "true"
  count = 2
}

# Network Subnet
resource "openstack_networking_subnet_v2" "subnet" {
  name            = "my-network-subnet-${count.index}"
  network_id      = openstack_networking_network_v2.network[count.index].id
  cidr            = "192.168.${count.index}.0/24"
  ip_version      = 4
  count = 2
}

# Interface between Router and Subnet
resource "openstack_networking_router_interface_v2" "interface" {
  router_id = openstack_networking_router_v2.global.id
  subnet_id = openstack_networking_subnet_v2.subnet[count.index].id
  count = 2
}