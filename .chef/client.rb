file_cache_path "/tmp/chef-client"
chef_repo_path File.expand_path("../../", __FILE__)
cookbook_path [
  "#{chef_repo_path}/cookbooks"
]
role_path "#{chef_repo_path}/roles"
environment_path "#{chef_repo_path}/environments"
ssl_verify_mode :verify_peer
