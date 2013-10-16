require 'spec_helper'

describe Twilio::REST::Message do
  before do
    @message = Twilio::REST::Message.new('someUri', 'someClient')
  end

  it 'sets up a media resources object' do
    @message.should respond_to(:media)
    @message.media.instance_variable_get('@path').should == 'someUri/Media'
  end
end
