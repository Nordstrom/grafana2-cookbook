template node['grafana']['conf_ini'] do
  source 'grafana.ini.erb'
  mode '600'
  owner node['grafana']['user']
  group node['grafana']['group']
  notifies :restart, 'service[grafana-server]', :delayed
end
