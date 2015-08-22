require 'spec_helper'

describe command('systemctl status firewalld') do
  let(:disable_sudo) { true }
  its(:stdout) { should contain('disabled') }
  its(:stdout) { should contain('inactive') }
end
