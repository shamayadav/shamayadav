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
    "rhel-image5"]


}
