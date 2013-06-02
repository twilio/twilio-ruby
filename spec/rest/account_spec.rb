require 'spec_helper'

describe Twilio::REST::Account do

  before do
    @account = Twilio::REST::Account.new('someUri', 'someClient')
  end

  it 'sets up incoming phone numbers resources object' do
    @account.should respond_to(:incoming_phone_numbers)
    @account.incoming_phone_numbers.instance_variable_get('@path').should == 'someUri/IncomingPhoneNumbers'
  end

  it 'sets up an available phone numbers resources object' do
    @account.should respond_to(:available_phone_numbers)
    @account.available_phone_numbers.instance_variable_get('@path').should == 'someUri/AvailablePhoneNumbers'
  end

  it 'sets up an outgoing caller ids resources object' do
    @account.should respond_to(:outgoing_caller_ids)
    @account.outgoing_caller_ids.instance_variable_get('@path').should == 'someUri/OutgoingCallerIds'
  end

  it 'sets up a calls resources object' do
    @account.should respond_to(:calls)
    @account.calls.instance_variable_get('@path').should == 'someUri/Calls'
  end

  it 'sets up a conferences resources object' do
    @account.should respond_to(:conferences)
    @account.conferences.instance_variable_get('@path').should == 'someUri/Conferences'
  end

  it 'sets up a queues resources object' do
    @account.should respond_to(:queues)
    @account.queues.instance_variable_get('@path').should == 'someUri/Queues'
  end

  it 'sets up a sms resource object' do
    @account.should respond_to(:sms)
    @account.sms.instance_variable_get('@path').should == 'someUri/SMS'
  end

  it 'sets up a recordings resources object' do
    @account.should respond_to(:recordings)
    @account.recordings.instance_variable_get('@path').should == 'someUri/Recordings'
  end

  it 'sets up a transcriptions resources object' do
    @account.should respond_to(:transcriptions)
    @account.transcriptions.instance_variable_get('@path').should == 'someUri/Transcriptions'
  end

  it 'sets up a notifications resources object' do
    @account.should respond_to(:notifications)
    @account.notifications.instance_variable_get('@path').should == 'someUri/Notifications'
  end
end
