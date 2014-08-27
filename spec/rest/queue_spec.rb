require 'spec_helper'

describe Twilio::REST::Queue do
  it 'should set up a members resources object' do
    queue = Twilio::REST::Queue.new('someUri', 'someClient')
    expect(queue).to respond_to(:members)
    expect(queue.members.instance_variable_get('@path')).to eq(
      'someUri/Members'
    )
  end
end
