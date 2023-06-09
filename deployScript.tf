variable "secgroup_id" {}
data "huaweicloud_availability_zones" "myaz" {}
data "huaweicloud_compute_flavors" "myflavor" {
  availability_zone = data.huaweicloud_availability_zones.myaz.names[0]
  performance_type  = "normal"
  cpu_core_count    = 2
   memory_size       = 4
}
data "huaweicloud_vpc_subnet" "mynet" {
  name = "xpanse_subnet1"
}
resource "huaweicloud_compute_instance" "basic" {
  name               = "basic"
  image_id           = "a8601887-81d5-4eed-9338-382cf5b6d80b"
  flavor_id          = data.huaweicloud_compute_flavors.myflavor.ids[0]
  availability_zone  = data.huaweicloud_availability_zones.myaz.names[0]
  network {
    uuid = data.huaweicloud_vpc_subnet.mynet.id
  }
}
