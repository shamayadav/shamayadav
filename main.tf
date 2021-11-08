provider "google" {
    project = "zeta-bebop-281216"
    region = "europe-west2"
    zone = "europe-west2-c"
    
}


/*
terraform {
  backend "gcs"{
      bucket="tf-state-om-tech"
      prefix="terraform/state"
  }
}
*/
resource "google_compute_instance" "vm1" {
  name="client1-vm"
  machine_type="f1-micro"

  network_interface {
    network="default"
      access_config{
      }
  }

  boot_disk {
    initialize_params{
        image="rhel-cloud/rhel-8"
    }
  }
    tags = ["image-template",
    "rhel-image"]

    metadata = {
    startup-script = <<-EOF
    sudo su -
    useradd mgmtbld
    touch /etc/sudoers.d/mgmtbld
    cd /etc/sudoers.d
    echo "%mgmtbld ALL=(ALL:ALL) NOPASSWD:ALL">mgmtbld
  EOF
  }
}
/*
#Second VM--
resource "google_compute_instance" "vm2" {
  name="vm2"
  machine_type="f1-micro"

  network_interface {
    network="default"
  }

  boot_disk {
    initialize_params{
        image="rhel-cloud/rhel-8"
    }
  }
    tags = ["image-template",
    "rhel-image"]

    metadata = {
    startup-script = <<-EOF
    sudo su -
    useradd mgmtbld
    touch /etc/sudoers.d/mgmtbld
    cd /etc/sudoers.d
    echo "%mgmtbld ALL=(ALL:ALL) NOPASSWD:ALL">mgmtbld
  EOF
  }
}
#Third VM--
resource "google_compute_instance" "vm3" {
  name="vm3"
  machine_type="f1-micro"

  network_interface {
    network="default"
  }

  boot_disk {
    initialize_params{
        image="rhel-cloud/rhel-8"
    }
  }
    tags = ["image-template",
    "rhel-image"]

    metadata = {
    startup-script = <<-EOF
    sudo su -
    useradd mgmtbld
    touch /etc/sudoers.d/mgmtbld
    cd /etc/sudoers.d
    echo "%mgmtbld ALL=(ALL:ALL) NOPASSWD:ALL">mgmtbld
  EOF
  }
}

#Fourth VM--
resource "google_compute_instance" "vm4" {
  name="vm4"
  machine_type="f1-micro"

  network_interface {
    network="default"
  }

  boot_disk {
    initialize_params{
        image="rhel-cloud/rhel-8"
    }
  }
    tags = ["image-template",
    "rhel-image"]


    metadata = {
    startup-script = <<-EOF
    sudo su -
    useradd mgmtbld
    touch /etc/sudoers.d/mgmtbld
    cd /etc/sudoers.d
    echo "%mgmtbld ALL=(ALL:ALL) NOPASSWD:ALL">mgmtbld
  EOF
  }
}
*/

output "vm-address1" {
  value=google_compute_instance.vm1.network_interface.0.network_ip
}
/*
output "vm-address2" {
  value=google_compute_instance.vm2.network_interface.0.network_ip
}

output "vm-address3" {
  value=google_compute_instance.vm3.network_interface.0.network_ip
}
output "vm-address4" {
  value=google_compute_instance.vm4.network_interface.0.network_ip
}
*/
