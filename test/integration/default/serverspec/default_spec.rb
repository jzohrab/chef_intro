require 'spec_helper'

describe 'chef_intro::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html

  describe file('/mydir/hello.txt') do
    it { should exist }
    it { should contain(/Hello/) }
  end
end
