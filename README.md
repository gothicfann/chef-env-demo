# chef-env-demo

This terraform module creates single instance demo chef-server/chef-dk environment in Google Cloud Platform.
Chef-repo is configured under `/root` directory.

## Usage

1. Change variable values in the `variables.tf` file and just run `terraform apply` command.
2. Connect to the machine using ssh.
3. Switch user to root using `sudo -i`
4. Change directory to `~/chef-repo` and run command `knife ssl fetch`
5. Its done. Now you can start writing cookbooks and push them to chef server.
