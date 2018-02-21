# Project info
variable "account_file" {
  default     = "./secret_files/account.json"
  description = "Path to the google service account credentials file"
}
variable "project_id" {
  default     = "chef-project-195708"
  description = "Your projects ID"
}
variable "region" {
  default     = "us-central1"
  description = "Select desired region to start provisioning"
}

# Chef server
variable "hostname" {
  default     = "chefserver"
  description = "Chef servers hostname"
}
variable "machine_type" {
  default     = "n1-standard-2"
  description = "Instance type"
}

# GCE sshinfo
variable "ssh_user" {
  default     = "ikorpashvili"
  description = "SSH username for GCE login"
}
variable "ssh_private_key" {
  default     = "./secret_files/id_rsa"
  description = "Path to private ssh key for SSH login"
}
variable "ssh_public_key" {
  default     = "./secret_files/id_rsa.pub"
  description = "Path to public ssh key to put it on the chefserver"
}


# Chef server rpm
variable "chefserver_rpm" {
  default     = "https://packages.chef.io/files/stable/chef-server/12.17.15/el/7/chef-server-core-12.17.15-1.el7.x86_64.rpm"
  description = "Chef Server rpm URL"
}

# Chef server userinfo
variable "chef_username" {
  default     = "root"
  description = "Chef servers login username"
}
variable "chef_password" {
  default     = "p@ssw0rd"
  description = "Chef servers login password"
}
variable "chef_fname" {
  default     = "root"
  description = "Chef servers users first name"
}
variable "chef_lname" {
  default     = "root"
  description = "Chef servers users last name"
}
variable "chef_email" {
  default     = "root@chefserver.local"
  description = "Chef servers users email"
}

# Chef server orginfo
variable "org_short_name" {
  default     = "c4s"
  description = "Chef servers organizations short name"
}
variable "org_full_name" {
  default     = "clips4sale"
  description = "Chef servers organizations full name"
}

# Chef workstation rpm
variable "chefwork_rpm" {
  default     = "https://packages.chef.io/files/stable/chefdk/2.4.17/el/7/chefdk-2.4.17-1.el7.x86_64.rpm"
  description = "ChefDK rpm URL"
}
