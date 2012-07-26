require 'spec_helper'

describe Twilio::REST::Recording do
  it 'should set up a transcriptions resources object' do
    call = Twilio::REST::Recording.new('someUri', 'someClient')
    call.respond_to?(:transcriptions).should == true
    call.transcriptions.instance_variable_get('@uri').should == 'someUri/Transcriptions'
  end
end