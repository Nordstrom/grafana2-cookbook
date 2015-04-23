#
# Copyright (c) 2015 Nordstrom, Inc.
#

require 'spec_helper'

# this is a generic ServerSpec test.  It just runs 'whoami'
# and confirms that it returns 'root'.  In a real test suite,
# you would want to test things like directories, users,
# processes, services, etc.
#
# for more information on the things ServerSpec can test, refer
# to the documentation at http://serverspec.org
describe command('whoami') do
  its(:stdout) { should eq "root\n" }
end

describe 'Grafana Daemon' do
  it 'is listening on port 3000' do
    expect(port(3000)).to be_listening
  end

  it 'has a running service of grafana-server' do
    expect(service('grafana-server')).to be_running
  end
end
