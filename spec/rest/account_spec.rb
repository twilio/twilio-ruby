require 'spec_helper'

describe Twilio::REST::Account do

  before do
    @account = Twilio::REST::Account.new('someUri', 'someClient')
  end

  it 'sets up incoming phone numbers resources object' do
    expect(@account).to respond_to(:incoming_phone_numbers)
    expect(@account.incoming_phone_numbers.instance_variable_get('@path')).to(
      eq('someUri/IncomingPhoneNumbers')
    )
  end

  it 'sets up an available phone numbers resources object' do
    expect(@account).to respond_to(:available_phone_numbers)
    expect(@account.available_phone_numbers.instance_variable_get('@path')).to(
      eq('someUri/AvailablePhoneNumbers')
    )
  end

  it 'sets up an outgoing caller ids resources object' do
    expect(@account).to respond_to(:outgoing_caller_ids)
    expect(@account.outgoing_caller_ids.instance_variable_get('@path')).to eq(
      'someUri/OutgoingCallerIds'
    )
  end

  it 'sets up a calls resources object' do
    expect(@account).to respond_to(:calls)
    expect(@account.calls.instance_variable_get('@path')).to eq('someUri/Calls')
  end

  it 'sets up a conferences resources object' do
    expect(@account).to respond_to(:conferences)
    expect(@account.conferences.instance_variable_get('@path')).to eq(
      'someUri/Conferences'
    )
  end

  it 'sets up a queues resources object' do
    expect(@account).to respond_to(:queues)
    expect(@account.queues.instance_variable_get('@path')).to eq(
      'someUri/Queues'
    )
  end

  it 'sets up a sms resource object' do
    expect(@account).to respond_to(:sms)
    expect(@account.sms.instance_variable_get('@path')).to eq('someUri/SMS')
  end

  it 'sets up a recordings resources object' do
    expect(@account).to respond_to(:recordings)
    expect(@account.recordings.instance_variable_get('@path')).to eq(
      'someUri/Recordings'
    )
  end

  it 'sets up a transcriptions resources object' do
    expect(@account).to respond_to(:transcriptions)
    expect(@account.transcriptions.instance_variable_get('@path')).to eq(
      'someUri/Transcriptions'
    )
  end

  it 'sets up a notifications resources object' do
    expect(@account).to respond_to(:notifications)
    expect(@account.notifications.instance_variable_get('@path')).to eq(
      'someUri/Notifications'
    )
  end

  it 'sets up a tokens resources object' do
    expect(@account).to respond_to(:tokens)
    expect(@account.tokens.instance_variable_get('@path')).to eq(
      'someUri/Tokens'
    )
  end

  it 'sets up an addresses resources object' do
    expect(@account).to respond_to(:addresses)
    expect(@account.addresses.instance_variable_get('@path')).to eq(
      'someUri/Addresses'
    )
  end

end
