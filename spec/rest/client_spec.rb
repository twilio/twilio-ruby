require 'spec_helper'

describe Twilio::REST::ObsoleteClient do
  it 'raise an exception' do
    expect { Twilio::REST::ObsoleteClient.new }.to raise_error(Twilio::REST::ObsoleteError)
  end
end

describe Twilio::REST::BaseClient do
  it 'raise an exception' do
    expect { Twilio::REST::BaseClient.new }.to raise_error(Twilio::REST::ObsoleteError)
  end
end

describe Twilio::REST::IpMessagingClient do
  it 'raise an exception' do
    expect { Twilio::REST::IpMessagingClient.new }.to raise_error(Twilio::REST::ObsoleteError)
  end
end

describe Twilio::REST::LookupsClient do
  it 'raise an exception' do
    expect { Twilio::REST::LookupsClient.new }.to raise_error(Twilio::REST::ObsoleteError)
  end
end

describe Twilio::REST::MonitorClient do
  it 'raise an exception' do
    expect { Twilio::REST::MonitorClient.new }.to raise_error(Twilio::REST::ObsoleteError)
  end
end

describe Twilio::REST::PricingClient do
  it 'raise an exception' do
    expect { Twilio::REST::PricingClient.new }.to raise_error(Twilio::REST::ObsoleteError)
  end
end

describe Twilio::REST::TaskRouterClient do
  it 'raise an exception' do
    expect { Twilio::REST::TaskRouterClient.new }.to raise_error(Twilio::REST::ObsoleteError)
  end
end

describe Twilio::REST::TrunkingClient do
  it 'raise an exception' do
    expect { Twilio::REST::TrunkingClient.new }.to raise_error(Twilio::REST::ObsoleteError)
  end
end

describe Twilio::REST::Client do
  before do
    Twilio.configure do |config|
      config.account_sid = 'someSid'
      config.auth_token = 'someToken'
      config.http_client = 'someClient'
    end
  end

  it 'uses the global configuration by default' do
    @client = Twilio::REST::Client.new
    expect(@client.account_sid).to eq('someSid')
    expect(@client.auth_token).to eq('someToken')
    expect(@client.http_client).to eq('someClient')
  end

  it 'uses the arguments over global configuration' do
    @client = Twilio::REST::Client.new('myUser', 'myPassword', nil, nil, 'myClient')
    expect(@client.account_sid).to eq('myUser')
    expect(@client.auth_token).to eq('myPassword')
    expect(@client.http_client).to eq('myClient')
  end

  it 'successfully validates the working SSL certificate' do
    @holodeck.mock Twilio::Response.new(200, '')
    expect { @client.validate_ssl_certificate }.not_to raise_error
  end

  it 'fails to validate broken SSL certificates' do
    @holodeck.mock Twilio::Response.new(504, '')
    expect { @client.validate_ssl_certificate }.to raise_error(Twilio::REST::RestError)
  end

  it 'translates bad request error params' do
    @domain = MyDomain.new(@client)
    @version = MyVersion.new(@domain)
    @error_message = '{
                        "code": 20001,
                        "message": "Bad request",
                        "more_info": "https://www.twilio.com/docs/errors/20001",
                        "status": 400,
                        "details": {
                            "foo":"bar"
                    }}'
    @holodeck.mock Twilio::Response.new(400, @error_message)
    expect {
      @version.fetch('GET', 'http://foobar.com')
    }.to raise_error { |error|
      expect(error).to be_a(Twilio::REST::RestError)
      expect(error.status_code).to eq(400)
      expect(error.code).to eq(20_001)
      expect(error.details).to eq({ 'foo' => 'bar' })
      expect(error.error_message).to eq('Bad request')
      expect(error.more_info).to eq('https://www.twilio.com/docs/errors/20001')
    }
  end

  class MyVersion < Twilio::REST::Version
    def initialize(domain)
      super
      @version = 'v1'
    end
  end

  class MyDomain < Twilio::REST::Domain
    def initialize(client)
      super
      @host = 'twilio.com'
      @base_url = 'https://twilio.com'
      @port = 443
    end
  end
end
