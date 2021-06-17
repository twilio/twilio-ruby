require 'spec_helper'
require 'logger'

describe Twilio::REST::Domain do
  class MyDomain < Twilio::REST::Domain
    def initialize(client)
      # Marshaled Properties
      @properties = {
          'account_sid' => "RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
          'auth_token' => "ABC1234",
          'url' => "http://www.example.com",
      }
    end
  end

  describe '#as_json' do
    before do
      @domain = MyDomain.new(@client)
      @json = @domain.as_json
    end

    it 'converts the objects properties to json' do
      expect(@json["account_sid"]).to eq("RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
      expect(@json["auth_token"]).to eq("ABC1234")
      expect(@json["url"]).to eq("http://www.example.com")
    end
  end
end
