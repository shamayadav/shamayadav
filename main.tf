provider "google" {
    project = "zeta-bebop-281216"
    region = "europe-west2"
    zone = "europe-west2-a"
    
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
  name="vm1"
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
    "rhel-image5"]
    
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
