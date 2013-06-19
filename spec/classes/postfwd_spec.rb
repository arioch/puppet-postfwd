require 'spec_helper'

describe 'postfwd', :type => :class do
  let(:pre_condition) { '$concat_basedir = "/tmp"' }
  let (:params) {
    {
      :config_file => '/etc/postfix/postfwd.cf'
    }
  }

  describe 'without parameters' do
    let (:facts) { debian_facts }

    it { should create_class('postfwd') }
    it { should include_class('postfwd::install') }
    it { should include_class('postfwd::config') }
    it { should include_class('postfwd::service') }

    it { should contain_package('postfwd').with_ensure('present') }
    it { should contain_file('/etc/postfix/postfwd.cf').with_ensure('present') }

    it { should contain_service('postfwd').with(
        'ensure'     => 'running',
        'enable'     => 'true',
        'hasrestart' => 'true'
      )
    }
  end

  describe 'with parameter: pkg_ensure' do
    let (:facts) { debian_facts }
    let (:params) { { :pkg_ensure => '_VALUE_' } }

    it { should contain_package('postfwd').with_ensure('_VALUE_') }
  end

  describe 'with parameter: config_file' do
    let (:facts) { debian_facts }
    let (:params) { { :config_file => '_VALUE_' } }

    it { should contain_file('_VALUE_').with_ensure('present') }
  end

  describe 'with parameter: config_file_mode' do
    let (:facts) { debian_facts }
    let (:params) { { :config_file_mode => '_VALUE_' } }

    it { should contain_file('/etc/postfix/postfwd.cf').with_mode('_VALUE_') }
  end

  describe 'with parameter: config_group' do
    let (:facts) { debian_facts }
    let (:params) { { :config_group => '_VALUE_' } }

    it { should contain_file('/etc/postfix/postfwd.cf').with_group('_VALUE_') }
  end

  describe 'with parameter: config_user' do
    let (:facts) { debian_facts }
    let (:params) { { :config_user => '_VALUE_' } }

    it { should contain_file('/etc/postfix/postfwd.cf').with_owner('_VALUE_') }
  end

  #describe 'with parameter: daemon_group' do
  #  let (:facts) { debian_facts }
  #  let (:params) { { :daemon_group => '_VALUE_' } }
  #
  #  it { should contain_file('/etc/default/postfwd').with_content(/_VALUE_/) }
  #end

  #describe 'with parameter: daemon_user' do
  #  let (:facts) { debian_facts }
  #  let (:params) { { :daemon_user => '_VALUE_' } }
  #
  #  it { should contain_file('/etc/default/postfwd').with_content(/_VALUE_/) }
  #end

  describe 'with parameter: pkg_ensure' do
    let (:facts) { debian_facts }
    let (:params) { { :pkg_ensure => '_VALUE_' } }

    it { should contain_package('postfwd').with_ensure('_VALUE_') }
  end

  describe 'with parameter: pkg_list' do
    let (:facts) { debian_facts }
    let (:params) { { :pkg_list => '_VALUE_' } }

    it { should contain_package('_VALUE_') }
  end

  describe 'with parameter: service_enable' do
    let (:facts) { debian_facts }
    let (:params) { { :service_enable => '_VALUE_' } }

    it { should contain_service('postfwd').with_enable('_VALUE_') }
  end

  describe 'with parameter: service_ensure' do
    let (:facts) { debian_facts }
    let (:params) { { :service_ensure => '_VALUE_' } }

    it { should contain_service('postfwd').with_ensure('_VALUE_') }
  end

  describe 'with parameter: service_hasstatus' do
    let (:facts) { debian_facts }
    let (:params) { { :service_hasstatus => '_VALUE_' } }

    it { should contain_service('postfwd').with_hasstatus('_VALUE_') }
  end

  describe 'with parameter: service_name' do
    let (:facts) { debian_facts }
    let (:params) { { :service_name => '_VALUE_' } }

    it { should contain_service('_VALUE_') }
  end
end

