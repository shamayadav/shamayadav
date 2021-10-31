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

resource "google_compute_instance" "vm_git_jenkins_cicd" {
  name="cicdnew"
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


}

resource "google_compute_instance" "vm-new" {
  name="testing-vm"
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

 
}
