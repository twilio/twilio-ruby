require 'spec_helper'

describe Twilio::REST::SMS::Message do

  before do
    client = double("Client")
    allow(client).to receive(:post) do 
      {'sid' => 'qwerty' } 
    end

    allow(client).to receive(:get) do 
      {'sid' => 'qwerty', 'sms_message' => [] } 
    end
    
    allow(client).to receive(:delete) do 
      {'sid' => 'qwerty' } 
    end

    @message = Twilio::REST::SMS::Message.new('someUri',client)
  end
 
  it 'should warn of deprecation of SMS Message Update' do
    expect(@message).to receive(:warn)
    @message.update
  end

  it 'should warn of deprecation of SMS Message Refresh' do
    expect(@message).to receive(:warn)
    @message.refresh
  end

  it 'should warn of deprecation of SMS Message Delete' do
    expect(@message).to receive(:warn)
    @message.delete
  end

end