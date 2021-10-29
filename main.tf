provider "google" {
    project = "hsbc-329610"
    region = "europe-west2"
    zone = "europe-west2-c"
    credentials = "credential.json"
}


terraform {
  backend "gcs"{
      bucket="tf-state-om-tech"
      prefix="terraform/state"
  }
}



resource "google_compute_instance" "template-vm" {
  name="template-vm"
  machine_type="e2-medium"

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
/*
resource "google_compute_instance" "image-vm" {
  name="image-vm"
  machine_type="e2-medium"

  network_interface {
    network="hsbc-shared-vpc"
  }

  boot_disk {
    source = google_compute_disk.f-disk.name
  }
    
}

resource "google_compute_disk" "f-disk" {
  name="image-vm-vol"
  image=resource.google_compute_machine_image.rhel-image.self_link
  type="ps-ssd"
  size=100


}

#data "google_compute_image" "t-google-compute-image" {
#    source=google_compute_machine_image.rhel-image.name
#}

resource "google_compute_machine_image" "rhel-image" {
  provider        = google-beta
  name="rhel-image"
  source_instance= google_compute_instance.template-vm.self_link
}
*/
