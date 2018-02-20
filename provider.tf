// Configure the Google Cloud provider
provider "google" {
  credentials = "${var.account_file}"
  project     = "${var.project_id}"
  region      = "${var.region}"
}
