require 'spec_helper'

describe Twilio::REST::Conference do
  it 'should set up a participants resources object' do
    conference = Twilio::REST::Conference.new('someUri', 'someClient')
    conference.respond_to?(:participants).should == true
    conference.participants.instance_variable_get('@uri').should == 'someUri/Participants'
  end
end
