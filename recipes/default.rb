#
# Recipe: grafana2::default
# Copyright (c) 2015 Nordstrom, Inc.
#

# TODO split install into package vs file based on attributes
include_recipe 'grafana2::install'

include_recipe 'grafana2::service'
include_recipe 'grafana2::config'
