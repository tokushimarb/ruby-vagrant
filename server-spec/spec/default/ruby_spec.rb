require 'spec_helper'

describe command('rvm -v') do
  let(:disable_sudo) { true }
  its(:stdout) { should contain('rvm 1.26.11') }
end

describe command('ruby -v') do
  let(:disable_sudo) { true }
  its(:stdout) { should contain('ruby 2.2.2p95') }
end

describe command('gem -v') do
  let(:disable_sudo) { true }
  its(:stdout) { should contain('2.4.8') }
end

describe command('gem list') do
  let(:disable_sudo) { true }
  its(:stdout) { should contain('bundler') }
  its(:stdout) { should contain('rake') }
end

describe file('/home/vagrant/.gemrc') do
  it { should contain('--no-rdoc') }
  it { should contain('--no-ri') }
end
