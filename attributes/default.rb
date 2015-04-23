#
# Cookbook grafana2
# Copyright (c) 2015 Nordstrom, Inc.
#

default['grafana']['log_dir'] = '/var/log/grafana'
default['grafana']['log_level'] = 'Info' # Either "Trace", "Debug", "Info", "Warn", "Error", "Critical"
default['grafana']['protocol'] = 'http'
default['grafana']['port'] = '8080'
default['grafana']['domain'] = 'grafana2.example.com'

default['grafana']['db_type'] = 'mysql'
default['grafana']['db_port'] = '3306'
default['grafana']['db_host'] = 'grafana2-mysql.example.com'
default['grafana']['db_name'] = 'grafana'
default['grafana']['db_user'] = 'grafana_user'
default['grafana']['db_password'] = 'SECRET'

default['grafana']['session_type'] = 'mysql'

default['grafana']['user'] = 'grafana'
default['grafana']['group'] = 'grafana'
default['grafana']['conf_ini'] = '/etc/grafana/grafana.ini'

default['grafana']['yum_repo_url'] = 'https://packagecloud.io'
