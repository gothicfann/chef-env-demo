# Creating firewall rules for chefserver
resource "google_compute_firewall" "chefserver" {
  name      = "chefserver-ingress"
  direction = "INGRESS"
  network   = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  target_tags = ["chefserver"]
}

# Chef Server provisioning
resource "google_compute_instance" "chefserver" {
  name         = "${var.hostname}"
  machine_type = "${var.machine_type}"
  zone         = "us-central1-a"
  allow_stopping_for_update = true
  tags = ["chefserver"]

  boot_disk {
    initialize_params {
      image = "centos-7"
    }
  }
  scratch_disk {
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  metadata {
    ssh-keys = "${var.ssh_user}:${file(var.ssh_public_key)}"
    block-project-ssh-keys = true
  }

  metadata_startup_script = "${data.template_file.provision.rendered}"

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
