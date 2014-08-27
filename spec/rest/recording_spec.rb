require 'spec_helper'

describe Twilio::REST::Recording do
  it 'should set up a transcriptions resources object' do
    call = Twilio::REST::Recording.new('someUri', 'someClient')
    expect(call).to respond_to(:transcriptions)
    expect(call.transcriptions.instance_variable_get('@path')).to eq(
      'someUri/Transcriptions'
    )
  end
end
