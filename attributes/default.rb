#
# Cookbook grafana2
# Copyright (c) 2015 Nordstrom, Inc.
#

### INSTALL ###
default['grafana']['user'] = 'grafana'
default['grafana']['group'] = 'grafana'
default['grafana']['conf_ini'] = '/etc/grafana/grafana.ini'
default['grafana']['repo_url'] = 'https://packagecloud.io'
default['grafana']['version'] = '' # '2.0.2-1' If you really want to pin

### PATHS ###
default['grafana']['log_dir'] = '/var/log/grafana'

### SERVER ###

default['grafana']['port'] = '3000'
default['grafana']['protocol'] = 'http'
default['grafana']['domain'] = 'grafana2.example.com'

### DATABASE ###
## mysql
# default['grafana']['db_type'] = 'mysql' # Either mysql, postgres, or sqlite3
# default['grafana']['db_host'] = 'grafana2-mysql.example.com:3306' # ip/hostname:port
# default['grafana']['db_name'] = 'grafana'
# default['grafana']['db_user'] = 'grafana_user' # Only for mysql/postgres
# default['grafana']['db_password'] = 'SECRET'   # Only for mysql/postgres
## postgres
# default['grafana']['db_type'] = 'postgres' # Either mysql, postgres, or sqlite3
# default['grafana']['db_host'] = 'grafana2-postgres.example.com:5432' # ip/hostname:port
# default['grafana']['db_name'] = 'grafana'
# default['grafana']['db_user'] = 'grafana_user' # Only for mysql/postgres
# default['grafana']['db_password'] = 'SECRET'   # Only for mysql/postgres
# default['grafana']['ssl_mode'] = 'verify-full'     # Postgres only, either 'disable', 'require', or 'verify-full'
## sqlite3
default['grafana']['db_type'] = 'sqlite3' # Either mysql, postgres, or sqlite3
default['grafana']['db_file'] = 'grafana.db'
default['grafana']['db_name'] = 'grafana'

### AUTH.ANONYMOUS ###
default['grafana']['anon_enabled'] = 'true' # 'true' or 'false'
default['grafana']['org_name'] = 'Main Org.'

### SESSION ###
default['grafana']['session_type'] = 'memory' # Either 'memory', 'file', 'mysql', or 'postgres'
# default['grafana']['session_type'] = 'mysql' # Either 'memory', 'file', 'mysql', or 'postgres'

### LOGGING ###
default['grafana']['log_level'] = 'Info' # Either "Trace", "Debug", "Info", "Warn", "Error", "Critical"
