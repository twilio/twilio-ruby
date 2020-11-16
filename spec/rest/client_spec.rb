require 'spec_helper'
require 'logger'

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
  context 'configuration' do
    before do
      Twilio.configure do |config|
        config.account_sid = 'someSid'
        config.auth_token = 'someToken'
        config.http_client = 'someClient'
        config.region = 'someRegion'
        config.edge = 'someEdge'
        config.logger = 'someLogger'
      end
    end

    it 'uses the global configuration by default' do
      @client = Twilio::REST::Client.new
      expect(@client.account_sid).to eq('someSid')
      expect(@client.auth_token).to eq('someToken')
      expect(@client.http_client).to eq('someClient')
      expect(@client.region).to eq('someRegion')
      expect(@client.edge).to eq('someEdge')
      expect(@client.logger).to eq('someLogger')
    end

    it 'uses the arguments over global configuration' do
      @client = Twilio::REST::Client.new('myUser', 'myPassword', nil, 'myRegion', 'myClient', 'myLogger')
      @client.edge = 'myEdge'
      expect(@client.account_sid).to eq('myUser')
      expect(@client.auth_token).to eq('myPassword')
      expect(@client.http_client).to eq('myClient')
      expect(@client.region).to eq('myRegion')
      expect(@client.edge).to eq('myEdge')
      expect(@client.logger).to eq('myLogger')
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

  context 'validation' do
    before :all do
      Twilio.configure do |config|
        config.account_sid = 'someSid'
        config.auth_token = 'someToken'
        config.http_client = 'someClient'
        config.region = nil
        config.edge = nil
        config.logger = nil
      end
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
  end

  context 'logging' do
    it 'logs the call details' do
      @client.logger = Logger.new(STDOUT)
      @holodeck.mock Twilio::Response.new(200, {})
      expect {
        @client.request('host', 'port', 'GET', 'http://foobar.com')
      }.to output(/Host:foobar.com/).to_stdout_from_any_process
    end

    it 'does not log when the logger instance is not passed' do
      @holodeck.mock Twilio::Response.new(200, {})
      expect {
        @client.request('host', 'port', 'GET', 'http://foobar.com')
      }.to_not output(/Host:foobar.com/).to_stdout_from_any_process
    end
  end

  describe '#build_uri' do
    before(:all) do
      Twilio.configure do |config|
        config.account_sid = 'username'
        config.auth_token = 'password'
        config.region = nil
        config.edge = nil
      end
    end

    context 'no region or edge in url' do
      it "doesn't set region or edge" do
        @client = Twilio::REST::Client.new
        expect(@client.build_uri('https://api.twilio.com')).to eq('https://api.twilio.com')
      end

      it 'uses the default region if edge set' do
        @client = Twilio::REST::Client.new
        @client.edge = 'edge'
        expect(@client.build_uri('https://api.twilio.com')).to eq('https://api.edge.us1.twilio.com')
      end

      it 'sets region' do
        @client = Twilio::REST::Client.new
        @client.region = 'region'
        expect(@client.build_uri('https://api.twilio.com')).to eq('https://api.region.twilio.com')
      end

      it 'sets region and edge' do
        @client = Twilio::REST::Client.new
        @client.region = 'region'
        @client.edge = 'edge'
        expect(@client.build_uri('https://api.twilio.com')).to eq('https://api.edge.region.twilio.com')
      end
    end

    context 'region in url' do
      it 'uses url region' do
        @client = Twilio::REST::Client.new
        expect(@client.build_uri('https://api.urlRegion.twilio.com')).to eq('https://api.urlRegion.twilio.com')
      end

      it 'uses client edge and url region' do
        @client = Twilio::REST::Client.new
        @client.edge = 'edge'
        expect(@client.build_uri('https://api.urlRegion.twilio.com')).to eq('https://api.edge.urlRegion.twilio.com')
      end

      it 'prefers client region' do
        @client = Twilio::REST::Client.new
        @client.region = 'region'
        expect(@client.build_uri('https://api.urlRegion.twilio.com')).to eq('https://api.region.twilio.com')
      end

      it 'uses client edge and prefers client region' do
        @client = Twilio::REST::Client.new
        @client.region = 'region'
        @client.edge = 'edge'
        expect(@client.build_uri('https://api.urlRegion.twilio.com')).to eq('https://api.edge.region.twilio.com')
      end
    end

    context 'region and edge in url' do
      it 'uses url region and edge' do
        @client = Twilio::REST::Client.new
        expect(@client.build_uri('https://api.urlEdge.urlRegion.twilio.com')).to eq('https://api.urlEdge.urlRegion.twilio.com')
      end

      it 'prefers client edge' do
        @client = Twilio::REST::Client.new
        @client.edge = 'edge'
        expect(@client.build_uri('https://api.urlEdge.urlRegion.twilio.com')).to eq('https://api.edge.urlRegion.twilio.com')
      end

      it 'prefers client region' do
        @client = Twilio::REST::Client.new
        @client.region = 'region'
        expect(@client.build_uri('https://api.urlEdge.urlRegion.twilio.com')).to eq('https://api.urlEdge.region.twilio.com')
      end

      it 'prefers client region and edge' do
        @client = Twilio::REST::Client.new
        @client.region = 'region'
        @client.edge = 'edge'
        expect(@client.build_uri('https://api.urlEdge.urlRegion.twilio.com')).to eq('https://api.edge.region.twilio.com')
      end
    end
  end
end
