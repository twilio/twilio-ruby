require 'spec_helper'

describe Twilio::REST::Feedback do

  before do
    @call = Twilio::REST::Call.new('someUri', 'someClient')
  end

  it 'sets up a feedback resources object' do
    @call.should respond_to(:feedback)
    @call.feedback.instance_variable_get('@path').should == 'someUri/Feedback'
  end

end

describe Twilio::REST::Summary do

  before do
    @calls = Twilio::REST::Calls.new('someUri', 'someClient')
  end

  it 'sets up a feedback summary object' do
      @calls.should respond_to(:summary)
      @calls.summary.instance_variable_get('@path').should == 'someUri/Summary'
  end

end
