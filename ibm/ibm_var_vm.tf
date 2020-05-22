variable "datacenter" {
 default = "extrm-rdu"
}
variable "vm_domain" {
 default = "extremenetworks.com"
}
variable "vm_network_speed" {
 default = 10
}
variable "vm_cores" {
 default = 1
}
variable "vm_memory" {
 default = 1024
}
variable "vm_disks" {
 default = [25,20,15]
}

variable "vm_network" {
}

variable "vm_subnet" {
}

variable "private_vlan_id" {
 default = "ext_rdu_vlan_private"
}


# Create a new virtual guest
resource "ibm_compute_vm_instance" "EnterpriseVM" {
 hostname = "${var.vm_hostname}"
 os_reference_code = "${var.vm_os_reference_code}"
 domain = "${var.vm_domain}"
 datacenter = "${var.datacenter}"
 network_speed = "${var.vm_network_speed}"
 hourly_billing = true
 private_network_only = false
 cores = "${var.vm_cores}"
 memory = "${var.vm_memory}"
 disks = "${var.vm_disks}"
 user_metadata = "{\"value\":\"newvalue\"}"
 dedicated_acct_host_only = true
 local_disk = false
 ssh_key_ids = ["${var.vm_ssh_key}"]
 public_vlan_id  = "${var.vm_network}"
}
