#!/bin/bash

sleep 20
yum install git -y
rpm -Uvh ${chefwork_rpm}
echo 'eval "$(chef shell-init bash)"' >> /root/.bashrc
echo 'export PATH="/opt/chefdk/embedded/bin:$PATH"' >> /root/.bashrc && source /root/.bashrc
(cd /root/ && chef generate app chef-repo)
mkdir -p /root/chef-repo/.chef
echo '.chef' >> /root/chef-repo/.gitignore
rpm -Uvh ${chefserver_rpm}
chef-server-ctl reconfigure
chef-server-ctl user-create ${chef_username} ${chef_fname} ${chef_lname} ${chef_email} '${chef_password}' --filename ~/chef-repo/.chef/${chef_username}.pem
chef-server-ctl org-create ${org_short_name} '${org_full_name}' --association_user ${chef_username} --filename ~/chef-repo/.chef/${org_short_name}-validator.pem
chef-server-ctl install chef-manage
chef-server-ctl reconfigure
chef-manage-ctl reconfigure --accept-license
chef-server-ctl install opscode-push-jobs-server
chef-server-ctl reconfigure
opscode-push-jobs-server-ctl reconfigure
chef-server-ctl install opscode-reporting
chef-server-ctl reconfigure
opscode-reporting-ctl reconfigure --accept-license
echo '${knife_rb}' > /root/chef-repo/.chef/knife.rb
(cd /root/chef-repo/ && knife ssl fetch)
exit 0
