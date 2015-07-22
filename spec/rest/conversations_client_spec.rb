require 'spec_helper'

describe Twilio::REST::ConversationsClient do
  before do
    @client = Twilio::REST::ConversationsClient.new('AC123', 'foobar')
  end

  it 'should set up an conversations resources object' do
    expect(@client).to respond_to(:conversations)
    expect(@client.conversations.instance_variable_get('@path')).to eq('/v1/Conversations')
  end

end
