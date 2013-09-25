require 'spec_helper'

describe Twilio::REST::Message do
  before do
    @message = Twilio::REST::Message.new('someUri', 'someClient')
  end

  it 'sets up a media resources object' do
    @message.should respond_to(:media)
    @message.media.instance_variable_get('@path').should == 'someUri/Media'
  end

  it 'does not use the old endpoint' do
    client = Twilio::REST::Client.new('someId', 'sometoken')
    client.account.sms.messages.instance_variable_get('@path').include?('/SMS').should be_false
  end
end
