require 'spec_helper'

describe Twilio::REST::Conference do
  it 'should set up a participants resources object' do
    conference = Twilio::REST::Conference.new('someUri', 'someClient')
    expect(conference).to respond_to(:participants)
    expect(conference.participants.instance_variable_get('@path')).to eq(
      'someUri/Participants'
    )
  end
end
