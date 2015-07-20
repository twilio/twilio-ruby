require 'spec_helper'

describe Twilio::REST::MonitorClient do
  before do
    @client = Twilio::REST::MonitorClient.new('AC123', 'foobar')
  end

  it 'should set up an event resources object' do
    expect(@client).to respond_to(:events)
    expect(@client.events.instance_variable_get('@path')).to eq('/v1/Events')
  end

  it 'should set up an alert resources object' do
    expect(@client).to respond_to(:alerts)
    expect(@client.alerts.instance_variable_get('@path')).to eq('/v1/Alerts')
  end
end
