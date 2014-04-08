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
