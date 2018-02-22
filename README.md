# terraform-chef

This terraform module creates single instance demo chef-server/chef-dk environment in Google Cloud Platform.
Chef-repo is configured under `/root` directory.

## Usage

1. Change variable values in the `variables.tf` file and just run `terraform apply` command.
2. It will take about 30 mins to fully setup chef environment on the machine. You can use ssh and monitor `/var/log/messages` startup-script logs to be sure every step is done.
3. Connect to the machine using ssh.
4. Switch user to root using `sudo -i`
5. Change directory to `~/chef-repo` and run command `knife ssl fetch`
6. Its done. Now you can start writing cookbooks and push them to chef server.
