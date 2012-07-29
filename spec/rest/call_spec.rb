require 'spec_helper'

describe Twilio::REST::Call do
  it 'should set up a recordings resources object' do
    call = Twilio::REST::Call.new('someUri', 'someClient')
    call.respond_to?(:recordings).should == true
    call.recordings.instance_variable_get('@uri').should == 'someUri/Recordings'
  end

  it 'should set up a notifications resources object' do
    call = Twilio::REST::Call.new('someUri', 'someClient')
    call.respond_to?(:notifications).should == true
    call.notifications.instance_variable_get('@uri').should == 'someUri/Notifications'
  end
end