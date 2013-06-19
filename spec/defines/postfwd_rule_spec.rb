require 'spec_helper'

describe 'postfwd::rule', :type => :define do
  let (:pre_condition) { '$concat_basedir = "/tmp"' }

  context 'without parameters' do
    let (:facts) { debian_facts }
    let (:title) { '_VALUE_' }

    it do
      expect { should create_class('postfwd') }.to raise_error(Puppet::Error)
    end
  end

  context 'with parameter: action' do
    let (:facts) { debian_facts }
    let (:title) { '_NAME_' }
    let (:params) { { :action => '_ACTION_' } }

    it do
      expect { should create_class('postfwd') }.to raise_error(Puppet::Error)
    end
  end

  context 'with parameter: policy' do
    let (:facts) { debian_facts }
    let (:title) { '_NAME_' }
    let (:params) { { :policy => '_POLICY_' } }

    it do
      expect { should create_class('postfwd') }.to raise_error(Puppet::Error)
    end
  end

  context 'with parameter: order' do
    let (:facts) { debian_facts }
    let (:title) { '_NAME_' }
    let (:params) { { :order => '_ORDER_' } }

    it do
      expect { should create_class('postfwd') }.to raise_error(Puppet::Error)
    end
  end

  context 'with parameter: target' do
    let (:facts) { debian_facts }
    let (:title) { '_NAME_' }
    let (:params) { { :target => '_TARGET_' } }

    it do
      expect { should create_class('postfwd') }.to raise_error(Puppet::Error)
    end
  end

  context 'with parameters' do
    let (:facts) { debian_facts }
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :action => '_ACTION_',
        :order  => '_ORDER_',
        :policy => '_POLICY_',
        :target => '_TARGET_'
      }
    }

    it { should create_postfwd__rule('_NAME_') }
    it { should contain_concat__fragment('postfwd_rule__NAME_').with_content(/_NAME_/) }
    it { should contain_concat__fragment('postfwd_rule__NAME_').with_content(/id=RULE_ORDER_/) }
    it { should contain_concat__fragment('postfwd_rule__NAME_').with_content(/_ACTION_/) }
    it { should contain_concat__fragment('postfwd_rule__NAME_').with_content(/_POLICY_/) }
  end
end

