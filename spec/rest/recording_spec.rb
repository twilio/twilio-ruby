require 'spec_helper'

describe Twilio::REST::Recording do
  it 'should set up a transcriptions resources object' do
    call = Twilio::REST::Recording.new('someUri', 'someClient')
    call.should respond_to(:transcriptions)
    call.transcriptions.instance_variable_get('@path').should == 'someUri/Transcriptions'
  end
end
