require 'spec_helper'

describe Twilio::REST::FeedbackSummary do
  it 'creates a feedback summary object' do
    calls = Twilio::REST::Calls.new('someUri', 'someClient')
    expect(calls).to respond_to(:feedback_summary)
    expect(calls.feedback_summary.instance_variable_get('@path')).to eq('someUri/FeedbackSummary')
  end
end
