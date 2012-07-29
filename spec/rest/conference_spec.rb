require 'spec_helper'

describe Twilio::REST::Conference do
  it 'should set up a participants resources object' do
    call = Twilio::REST::Conference.new('someUri', 'someClient')
    call.respond_to?(:participants).should == true
    call.participants.instance_variable_get('@uri').should == 'someUri/Participants'
  end
end