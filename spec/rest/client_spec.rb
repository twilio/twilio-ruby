require 'spec_helper'

describe Twilio::REST::Client do
  it 'should not raise an error if the response body is empty' do
    FakeWeb.register_uri(:any, %r/api\.twilio\.com/, :body => '')
    twilio = Twilio::REST::Client.new('someSid', 'someToken')
    Twilio::REST::IncomingPhoneNumber.new('/phone_number', twilio).delete
  end

  it 'should not raise an error if the response body is nil' do
    response = double(:response, :body => nil)
    connection = double(:connection, :request => response)
    twilio = Twilio::REST::Client.new('someSid', 'someToken')
    twilio.instance_variable_set(:@connection, connection)
    Twilio::REST::IncomingPhoneNumber.new('/phone_number', twilio).delete
  end

  it 'should set up a new client instance with the given sid and token' do
    twilio = Twilio::REST::Client.new('someSid', 'someToken')
    twilio.account_sid.should == 'someSid'
    twilio.instance_variable_get('@auth_token').should == 'someToken'
  end
  
  it 'should set up the proper default http ssl connection' do
    twilio = Twilio::REST::Client.new('someSid', 'someToken')
    connection = twilio.instance_variable_get('@connection')
    connection.address.should == 'api.twilio.com'
    connection.port.should == 443
    connection.use_ssl?.should == true
  end
  
  it 'should set up the requested ssl verification ca_file if provided' do
    twilio = Twilio::REST::Client.new('someSid', 'someToken', :ssl_ca_file => '/path/to/ca/file')
    connection = twilio.instance_variable_get('@connection')
    connection.ca_file.should == '/path/to/ca/file'
  end

  it 'should set up the proper http ssl connection when a different domain is given' do
    twilio = Twilio::REST::Client.new('someSid', 'someToken', :host => 'api.faketwilio.com')
    connection = twilio.instance_variable_get('@connection')
    connection.address.should == 'api.faketwilio.com'
    connection.port.should == 443
    connection.use_ssl?.should == true
  end

  it 'should adjust the open and read timeouts on the underlying Net::HTTP object when asked' do
    timeout = rand(30)
    twilio = Twilio::REST::Client.new('someSid', 'someToken', :timeout => timeout)
    connection = twilio.instance_variable_get('@connection')
    connection.port.should == 443
    connection.use_ssl?.should == true
    connection.open_timeout.should == timeout
    connection.read_timeout.should == timeout
  end

  it 'should set up the proper http ssl connection when a proxy_host is given' do
    twilio = Twilio::REST::Client.new('someSid', 'someToken', :host => 'api.faketwilio.com', :proxy_addr => 'localhost')
    connection = twilio.instance_variable_get('@connection')
    connection.proxy?.should == true
    connection.proxy_address.should == 'localhost'
    connection.proxy_port.should == 80
    connection.address.should == 'api.faketwilio.com'
    connection.port.should == 443
    connection.use_ssl?.should == true
  end

  it 'should set up the proper http ssl connection when a proxy_host and proxy_port are given' do
    twilio = Twilio::REST::Client.new('someSid', 'someToken', :host => 'api.faketwilio.com', :proxy_addr => 'localhost', :proxy_port => 13128)
    connection = twilio.instance_variable_get('@connection')
    connection.proxy?.should == true
    connection.proxy_address.should == 'localhost'
    connection.proxy_port.should == 13128
    connection.address.should == 'api.faketwilio.com'
    connection.port.should == 443
    connection.use_ssl?.should == true
  end

  it 'should set up an accounts resources object' do
    twilio = Twilio::REST::Client.new('someSid', 'someToken')
    twilio.respond_to?(:accounts).should == true
    twilio.accounts.instance_variable_get('@uri').should == '/2010-04-01/Accounts'
  end

  it 'should set up an account object with the given sid' do
    twilio = Twilio::REST::Client.new('someSid', 'someToken')
    twilio.respond_to?(:account).should == true
    twilio.account.instance_variable_get('@uri').should == '/2010-04-01/Accounts/someSid'
  end

  it 'should convert all parameter names to Twilio-style names' do
    twilio = Twilio::REST::Client.new('someSid', 'someToken')
    untwilified = {:sms_url => 'someUrl', 'voiceFallbackUrl' => 'anotherUrl',
      'Status_callback' => 'yetAnotherUrl'}
    twilified = {:SmsUrl => 'someUrl', :VoiceFallbackUrl => 'anotherUrl',
      :StatusCallback => 'yetAnotherUrl'}
    twilio.instance_eval do
      twilify(untwilified).should == twilified
    end
  end
end
