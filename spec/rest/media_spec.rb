require 'spec_helper'

describe Twilio::REST::Media do
  before do
    @message = Twilio::REST::Message.new('someUri', 'someClient')
  end

  it 'sets up an images sub-resource object' do
    @message.media.images.instance_variable_get('@path').should == 'someUri/Media/Images'
  end
end
