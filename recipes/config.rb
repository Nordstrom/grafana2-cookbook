template node['grafana']['conf_ini'] do
  source 'grafana.ini.erb'
  mode '600'
  owner node['grafana']['user']
  group node['grafana']['group']
  notifies :restart, 'service[grafana-server]', :delayed
end

template "#{node['grafana']['ldap_config_file']}" do
  source 'ldap.toml.sample.erb'
  owner node['grafana']['user']
  group node['grafana']['group']
  mode '0600'
  notifies :restart, 'service[grafana-server]', :delayed
end