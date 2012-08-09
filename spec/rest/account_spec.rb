require 'spec_helper'

describe Twilio::REST::Account do
  it 'should set up an incoming phone numbers resources object' do
    account = Twilio::REST::Account.new('someUri', 'someClient')
    account.respond_to?(:incoming_phone_numbers).should == true
    account.incoming_phone_numbers.instance_variable_get('@uri').should == 'someUri/IncomingPhoneNumbers'
  end

  it 'should set up an available phone numbers resources object' do
    account = Twilio::REST::Account.new('someUri', 'someClient')
    account.respond_to?(:available_phone_numbers).should == true
    account.available_phone_numbers.instance_variable_get('@uri').should == 'someUri/AvailablePhoneNumbers'
  end

  it 'should set up an outgoing caller ids resources object' do
    account = Twilio::REST::Account.new('someUri', 'someClient')
    account.respond_to?(:outgoing_caller_ids).should == true
    account.outgoing_caller_ids.instance_variable_get('@uri').should == 'someUri/OutgoingCallerIds'
  end

  it 'should set up a calls resources object' do
    account = Twilio::REST::Account.new('someUri', 'someClient')
    account.respond_to?(:calls).should == true
    account.calls.instance_variable_get('@uri').should == 'someUri/Calls'
  end

  it 'should set up a conferences resources object' do
    account = Twilio::REST::Account.new('someUri', 'someClient')
    account.respond_to?(:conferences).should == true
    account.conferences.instance_variable_get('@uri').should == 'someUri/Conferences'
  end

  it 'should set up a queues resources object' do
    account = Twilio::REST::Account.new('someUri', 'someClient')
    account.respond_to?(:queues).should == true
    account.queues.instance_variable_get('@uri').should == 'someUri/Queues'
  end

  it 'should set up a sms resource object' do
    account = Twilio::REST::Account.new('someUri', 'someClient')
    account.respond_to?(:sms).should == true
    account.sms.instance_variable_get('@uri').should == 'someUri/SMS'
  end

  it 'should set up a recordings resources object' do
    account = Twilio::REST::Account.new('someUri', 'someClient')
    account.respond_to?(:recordings).should == true
    account.recordings.instance_variable_get('@uri').should == 'someUri/Recordings'
  end

  it 'should set up a transcriptions resources object' do
    account = Twilio::REST::Account.new('someUri', 'someClient')
    account.respond_to?(:transcriptions).should == true
    account.transcriptions.instance_variable_get('@uri').should == 'someUri/Transcriptions'
  end

  it 'should set up a notifications resources object' do
    account = Twilio::REST::Account.new('someUri', 'someClient')
    account.respond_to?(:notifications).should == true
    account.notifications.instance_variable_get('@uri').should == 'someUri/Notifications'
  end
end
