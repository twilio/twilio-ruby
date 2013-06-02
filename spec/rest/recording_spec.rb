require 'spec_helper'

describe Twilio::REST::Recording do
  before do
    @call = Twilio::REST::Recording.new('someUri', 'someClient')
    @call.instance_variable_get('@connection').stub(:address) { 'api.twilio.com/' }
  end

  it 'should set up a transcriptions resources object' do
    @call.should respond_to(:transcriptions)
    @call.transcriptions.instance_variable_get('@path').should == 'someUri/Transcriptions'
  end

  it 'returns a wave URL' do
    @call.wav.should == "https://api.twilio.com/someUri.wav"
  end

  it 'returns an mp3 URL' do
    @call.mp3.should == "https://api.twilio.com/someUri.mp3"
  end
end
