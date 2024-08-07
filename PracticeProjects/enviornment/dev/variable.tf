variable "rg_name" { default = "sb-rg" }
variable "rg_location" { default = "southindia" }

//Vnet details
variable "vnet-name" { default = "sb-vnet" }
variable "address_space" { default = ["10.0.0.0/16"] }

//subnet 
variable "subnet_details" {
  type = map(any)
  default = {
    subnet_A = ["10.0.0.0/24"]
    subnet_B = ["10.0.1.0/24"]
  }
}

//nic
variable "nic_details" {
  type = map(any)
  default = {
    nic1 = "subnet_A"
    nic2 = "subnet_B"
  }
}

//vm
variable "vm_details" {
  type = map(any)
  default = {
    frontend-vm = "nic1"
    backend-vm  = "nic2"
  }
}

