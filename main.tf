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

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

  provisioner "file" {
    content = "${data.template_file.provision.rendered}"
    destination = "/tmp/provision.sh"

    connection {
      type        = "ssh"
      user        = "${var.ssh_user}"
      private_key = "${file(var.ssh_private_key)}"
    }
  }

  provisioner "file" {
    content = "${data.template_file.knife.rendered}"
    destination = "/tmp/knife.rb"

    connection {
      type        = "ssh"
      user        = "${var.ssh_user}"
      private_key = "${file(var.ssh_private_key)}"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/provision.sh",
      "sudo /tmp/provision.sh",
      "sudo rm /tmp/provision.sh",
      "sudo mv /tmp/knife.rb /root/chef-repo/.chef/",
    ]

    connection {
      type        = "ssh"
      user        = "${var.ssh_user}"
      private_key = "${file(var.ssh_private_key)}"
    }
  }
}
