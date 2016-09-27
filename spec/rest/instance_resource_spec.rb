require 'spec_helper'

describe Twilio::REST::InstanceResource do
  it 'should set up an internal reference to the uri and client' do
    resource = Twilio::REST::InstanceResource.new('some/uri', 'someClient')
    expect(resource.instance_variable_get('@path')).to eq('some/uri')
    expect(resource.instance_variable_get('@client')).to eq('someClient')
  end

  it 'should set up object properties if passed' do
    params = { 'SomeKey' => 'someValue' }
    resource = Twilio::REST::InstanceResource.new('uri', 'client', params)
    expect(resource.some_key).to eq('someValue')
  end

  context 'lazy loading' do
    before do
      client = double
      expect(client).to receive(:get).with('uri').and_return({ 'SomeKey' => 'someValue' })
      @resource = Twilio::REST::InstanceResource.new('uri', client)
    end

    it 'should load when a missing method is called' do
      expect(@resource.some_key).to eq('someValue')
    end

    it 'should load when #respond_to? is called' do
      expect(@resource.respond_to?(:some_key)).to be(true)
    end
  end
end
