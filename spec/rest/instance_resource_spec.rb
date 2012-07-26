require 'spec_helper'

describe Twilio::REST::InstanceResource do
  it 'should set up an internal reference to the uri and client' do
    resource = Twilio::REST::InstanceResource.new('some/uri', 'someClient')
    resource.instance_variable_get('@uri').should == 'some/uri'
    resource.instance_variable_get('@client').should == 'someClient'
  end

  it 'should set up object properties if passed' do
    params = {'SomeKey' => 'someValue'}
    resource = Twilio::REST::InstanceResource.new('uri', 'client', params)
    resource.some_key.should == 'someValue'
  end
end