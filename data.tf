data "template_file" "knife" {
  template = "${file("templates/knife.rb.tpl")}"

  vars {
    chef_username = "${var.chef_username}"
    org_short_name = "${var.org_short_name}"
    project_id = "${var.project_id}"
  }
}

data "template_file" "provision" {
  template = "${file("templates/provision.sh.tpl")}"

  vars {
    chefwork_rpm = "${var.chefwork_rpm}"
    chefserver_rpm = "${var.chefserver_rpm}"
    chef_username = "${var.chef_username}"
    chef_fname = "${var.chef_fname}"
    chef_lname = "${var.chef_lname}"
    chef_email = "${var.chef_email}"
    chef_password = "${var.chef_password}"
    org_short_name = "${var.org_short_name}"
    org_full_name = "${var.org_full_name}"
  }
}
