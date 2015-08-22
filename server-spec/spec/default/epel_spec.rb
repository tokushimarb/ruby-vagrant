require 'spec_helper'

describe file('/etc/yum.repos.d/epel.repo') do
  let(:disable_sudo) { true }
  it { should contain('[epel]') }
end

describe command('yum list --enablerepo=epel') do
  its(:stdout) { should contain('epel') }
  its(:stdout) { should contain('p7zip') }
end

describe command('7za -h') do
  its(:stdout) { should contain('p7zip Version 9.20') }
end
