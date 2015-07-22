require 'spec_helper'

describe Twilio::REST::Conversations::Conversations do

  it 'creates an in_progress property' do
    client = Twilio::REST::ConversationsClient.new 'otherSid', 'otherToken'
    conversations = Twilio::REST::Conversations::Conversations.new '/v1/Conversations', client
    expect(conversations).to respond_to(:in_progress)
  end

  it 'creates a completed property' do
    client = Twilio::REST::ConversationsClient.new 'otherSid', 'otherToken'
    conversations = Twilio::REST::Conversations::Conversations.new '/v1/Conversations', client
    expect(conversations).to respond_to(:completed)
  end

end

describe Twilio::REST::Conversations::InProgressConversations do
  it 'gets constructed by conversations' do
    client = Twilio::REST::ConversationsClient.new 'otherSid', 'otherToken'
    conversations = Twilio::REST::Conversations::Conversations.new '/v1/Conversations', client
    expect(conversations.in_progress.instance_variable_get('@path')).to eq('/v1/Conversations/InProgress')
  end
  it 'uses Conversation as its instance class' do
    client = Twilio::REST::ConversationsClient.new 'otherSid', 'otherToken'
    conversations = Twilio::REST::Conversations::Conversations.new '/v1/Conversations', client
    expect(conversations.in_progress.instance_variable_get('@instance_class')).to eq(Twilio::REST::Conversations::Conversation)
  end
end

describe Twilio::REST::Conversations::CompletedConversations do
  it 'gets constructed by conversations' do
    client = Twilio::REST::ConversationsClient.new 'otherSid', 'otherToken'
    conversations = Twilio::REST::Conversations::Conversations.new '/v1/Conversations', client
    expect(conversations.completed.instance_variable_get('@path')).to eq('/v1/Conversations/Completed')
  end
  it 'uses Conversation as its instance class' do
    client = Twilio::REST::ConversationsClient.new 'otherSid', 'otherToken'
    conversations = Twilio::REST::Conversations::Conversations.new '/v1/Conversations', client
    expect(conversations.completed.instance_variable_get('@instance_class')).to eq(Twilio::REST::Conversations::Conversation)
  end
end

describe Twilio::REST::Conversations::Conversation do
  it 'has correct path when fetched from /InProgress' do
    client = Twilio::REST::ConversationsClient.new 'otherSid', 'otherToken'
    conversation = Twilio::REST::Conversations::Conversation.new '/v1/Conversations/InProgress/CA123', client
    expect(conversation.instance_variable_get('@path')).to eq('/v1/Conversations/CA123')
  end
  it 'has correct path when fetched from /Completed' do
    client = Twilio::REST::ConversationsClient.new 'otherSid', 'otherToken'
    conversation = Twilio::REST::Conversations::Conversation.new '/v1/Conversations/Completed/CA123', client
    expect(conversation.instance_variable_get('@path')).to eq('/v1/Conversations/CA123')
  end
  it 'sets up participants subresource' do
    client = Twilio::REST::ConversationsClient.new 'otherSid', 'otherToken'
    conversation = Twilio::REST::Conversations::Conversation.new '/v1/Conversations/CA123', client
    expect(conversation).to respond_to(:participants)
  end
end
