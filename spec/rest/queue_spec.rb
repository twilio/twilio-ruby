require 'spec_helper'

describe Twilio::REST::Queue do
  it 'should set up a members resources object' do
    queue = Twilio::REST::Queue.new('someUri', 'someClient')
    queue.respond_to?(:members).should == true
    queue.members.instance_variable_get('@uri').should == 'someUri/Members'
  end
end
