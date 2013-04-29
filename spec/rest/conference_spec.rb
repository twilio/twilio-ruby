require 'spec_helper'

describe Twilio::REST::Conference do
  it 'should set up a participants resources object' do
    conference = Twilio::REST::Conference.new('someUri', 'someClient')
    conference.should respond_to(:participants)
    conference.participants.instance_variable_get('@uri').should == 'someUri/Participants'
  end
end
