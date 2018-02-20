# Project info
variable "account_file" { default = "./secret_files/account.json" }
variable "project_id" { default = "chef-project-195708" }
variable "region" { default = "us-central1" }


# GCE sshinfo
variable "ssh_user" { default = "ikorpashvili" }
variable "ssh_private_key" { default = "./secret_files/id_rsa"}
variable "ssh_public_key" { default = "./secret_files/id_rsa.pub" }


# Chef server rpm
variable "chefserver_rpm" { default = "https://packages.chef.io/files/stable/chef-server/12.17.15/el/7/chef-server-core-12.17.15-1.el7.x86_64.rpm" }

# Chef server userinfo
variable "chef_username" { default = "root" }
variable "chef_password" { default = "p@ssw0rd" }
variable "chef_fname" { default = "root" }
variable "chef_lname" { default = "root" }
variable "chef_email" { default = "root@chefserver.local" }

# Chef server orginfo
variable "org_short_name" { default = "c4s" }
variable "org_full_name" { default = "clips4sale" }

# Chef workstation info
variable "chefwork_rpm" { default = "https://packages.chef.io/files/stable/chefdk/2.4.17/el/7/chefdk-2.4.17-1.el7.x86_64.rpm" }
