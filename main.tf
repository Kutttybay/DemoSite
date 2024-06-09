# main.tf

provider "google" {
  project = "your-project-id"
  region  = "us-central1"
}

resource "google_compute_instance" "example" {
  name         = "example-instance"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  metadata = {
    user-data = <<-EOF
                #!/bin/bash
                sudo docker login -u your-dockerhub-username -p your-dockerhub-password
                sudo docker pull your-dockerhub-username/sre:latest
                sudo docker run -d -p 8443:8443 your-dockerhub-username/sre:latest
                EOF
  }
}
