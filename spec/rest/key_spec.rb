require 'spec_helper'

describe Twilio::REST::Key do
  before do
    @key = Twilio::REST::Key.new('someUri', 'someClient')
  end

  it 'has correct path' do
    expect(@key.instance_variable_get('@path')).to eq('someUri')
  end
end
