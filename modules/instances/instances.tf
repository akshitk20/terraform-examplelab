resource "google_compute_instance" "instance1" {
  name         = "tf-instance-1"
  machine_type = "e2-standard-2"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-11-bullseye-v20241112"
    }
  }

 network_interface {
    network = "tf-vpc-760726"
    subnetwork = "subnet-01"
  }

 

   metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
   allow_stopping_for_update = true
  
}

resource "google_compute_instance" "instance2" {
  name         = "tf-instance-2"
  machine_type = "e2-standard-2"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-11-bullseye-v20241112"
    }
  }

 network_interface {
    network = "tf-vpc-760726"
    subnetwork = "subnet-02"
  }

 

   metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
   allow_stopping_for_update = true
  
}
