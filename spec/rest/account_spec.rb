require 'spec_helper'

describe Twilio::REST::Account do

  before do
    @account = Twilio::REST::Account.new('someUri', 'someClient')
  end

  it 'sets up incoming phone numbers resources object' do
    @account.respond_to?(:incoming_phone_numbers).should == true
    @account.incoming_phone_numbers.instance_variable_get('@uri').should == 'someUri/IncomingPhoneNumbers'
  end

  it 'sets up an available phone numbers resources object' do
    @account.respond_to?(:available_phone_numbers).should == true
    @account.available_phone_numbers.instance_variable_get('@uri').should == 'someUri/AvailablePhoneNumbers'
  end

  it 'sets up an outgoing caller ids resources object' do
    @account.respond_to?(:outgoing_caller_ids).should == true
    @account.outgoing_caller_ids.instance_variable_get('@uri').should == 'someUri/OutgoingCallerIds'
  end

  it 'sets up a calls resources object' do
    @account.respond_to?(:calls).should == true
    @account.calls.instance_variable_get('@uri').should == 'someUri/Calls'
  end

  it 'sets up a conferences resources object' do
    @account.respond_to?(:conferences).should == true
    @account.conferences.instance_variable_get('@uri').should == 'someUri/Conferences'
  end

  it 'sets up a queues resources object' do
    @account.respond_to?(:queues).should == true
    @account.queues.instance_variable_get('@uri').should == 'someUri/Queues'
  end

  it 'sets up a sms resource object' do
    @account.respond_to?(:sms).should == true
    @account.sms.instance_variable_get('@uri').should == 'someUri/SMS'
  end

  it 'sets up a recordings resources object' do
    @account.respond_to?(:recordings).should == true
    @account.recordings.instance_variable_get('@uri').should == 'someUri/Recordings'
  end

  it 'sets up a transcriptions resources object' do
    @account.respond_to?(:transcriptions).should == true
    @account.transcriptions.instance_variable_get('@uri').should == 'someUri/Transcriptions'
  end

  it 'sets up a notifications resources object' do
    @account.respond_to?(:notifications).should == true
    @account.notifications.instance_variable_get('@uri').should == 'someUri/Notifications'
  end
end
