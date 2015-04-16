require 'spec_helper'

describe Twilio::REST::SMS::Messages do

  before do
    client = double("Client")
    allow(client).to receive(:post) do 
      {'sid' => 'qwerty' } 
    end

    allow(client).to receive(:get) do 
      {'sid' => 'qwerty', 'sms_messages' => [] } 
    end
    @messages = Twilio::REST::SMS::Messages.new('someUri',client)
  end

  it 'should warn of deprecation of SMS Messages Create' do
    expect(@messages).to receive(:warn)
    @messages.create to: "+1", from: "+2", body: "But Jenny!"
  end  

  it 'should warn of deprecation of SMS Messages List' do
    expect(@messages).to receive(:warn)
    @messages.list to: "+1"
  end  
  
  it 'should warn of deprecation of SMS Messages Get' do
    expect(@messages).to receive(:warn)
    @messages.get sid: "qwerty"
  end  
end
