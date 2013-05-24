require 'spec_helper'

describe Twilio::REST::Call do

  before do
    @call = Twilio::REST::Call.new('someUri', 'someClient')
  end

  it 'sets up a recordings resources object' do
    @call.should respond_to(:recordings)
    @call.recordings.instance_variable_get('@path').should == 'someUri/Recordings'
  end

  it 'sets up a notifications resources object' do
    @call.should respond_to(:notifications)
    @call.notifications.instance_variable_get('@path').should == 'someUri/Notifications'
  end
end
