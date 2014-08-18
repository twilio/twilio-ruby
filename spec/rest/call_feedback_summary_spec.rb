require 'spec_helper'

describe Twilio::REST::FeedbackSummary do
  it 'creates a feedback summary object' do
    calls = Twilio::REST::Calls.new('someUri', 'someClient')
    calls.should respond_to(:feedback_summary)
    calls.feedback_summary.instance_variable_get('@path').should == 'someUri/FeedbackSummary'
  end
end