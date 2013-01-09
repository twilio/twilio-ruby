require 'spec_helper'

describe Twilio::REST::Call do

  before do
    @call = Twilio::REST::Call.new('someUri', 'someClient')
  end

  it 'sets up a recordings resources object' do
    @call.respond_to?(:recordings).should == true
    @call.recordings.instance_variable_get('@uri').should == 'someUri/Recordings'
  end

  it 'sets up a notifications resources object' do
    @call.respond_to?(:notifications).should == true
    @call.notifications.instance_variable_get('@uri').should == 'someUri/Notifications'
  end
end
