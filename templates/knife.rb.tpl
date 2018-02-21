current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                '${chef_username}'
client_key               "#{current_dir}/${chef_username}.pem"
validation_client_name   '${org_short_name}-validator'
validation_key           "#{current_dir}/${org_short_name}-validator.pem"
chef_server_url          'https://${chef_hostname}.c.${project_id}.internal/organizations/${org_short_name}'
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
