require 'spec_helper'

describe Twilio::REST::Token do
  before do
    @token = Twilio::REST::Token.new('someUri', 'someClient')
  end
end
