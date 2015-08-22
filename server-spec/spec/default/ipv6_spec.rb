require 'spec_helper'

describe command('/usr/sbin/sysctl net.ipv6.conf.all.disable_ipv6') do
  let(:disable_sudo) { true }
  its(:stdout) { should contain('net.ipv6.conf.all.disable_ipv6 = 1') }
end

describe command('/usr/sbin/sysctl net.ipv6.conf.default.disable_ipv6') do
  let(:disable_sudo) { true }
  its(:stdout) { should contain('net.ipv6.conf.default.disable_ipv6 = 1') }
end
