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
    expect(twilio.account_sid).to eq('someSid')
    expect(twilio.instance_variable_get('@auth_token')).to eq('someToken')
  end
  
  it 'should set up the proper default http ssl connection' do
    twilio = Twilio::REST::Client.new('someSid', 'someToken')
    connection = twilio.instance_variable_get('@connection')
    expect(connection.address).to eq('api.twilio.com')
    expect(connection.port).to eq(443)
    expect(connection.use_ssl?).to eq(true)
  end
  
  it 'should set up the requested ssl verification ca_file if provided' do
    twilio = Twilio::REST::Client.new('someSid', 'someToken', :ssl_ca_file => '/path/to/ca/file')
    connection = twilio.instance_variable_get('@connection')
    expect(connection.ca_file).to eq('/path/to/ca/file')
  end

  it 'should set up the proper http ssl connection when a different domain is given' do
    twilio = Twilio::REST::Client.new('someSid', 'someToken', :host => 'api.faketwilio.com')
    connection = twilio.instance_variable_get('@connection')
    expect(connection.address).to eq('api.faketwilio.com')
    expect(connection.port).to eq(443)
    expect(connection.use_ssl?).to eq(true)
  end

  it 'should adjust the open and read timeouts on the underlying Net::HTTP object when asked' do
    timeout = rand(30)
    twilio = Twilio::REST::Client.new('someSid', 'someToken', :timeout => timeout)
    connection = twilio.instance_variable_get('@connection')
    expect(connection.port).to eq(443)
    expect(connection.use_ssl?).to eq(true)
    expect(connection.open_timeout).to eq(timeout)
    expect(connection.read_timeout).to eq(timeout)
  end

  it 'should set up the proper http ssl connection when a proxy_host is given' do
    twilio = Twilio::REST::Client.new('someSid', 'someToken', :host => 'api.faketwilio.com', :proxy_addr => 'localhost')
    connection = twilio.instance_variable_get('@connection')
    expect(connection.proxy?).to eq(true)
    expect(connection.proxy_address).to eq('localhost')
    expect(connection.proxy_port).to eq(80)
    expect(connection.address).to eq('api.faketwilio.com')
    expect(connection.port).to eq(443)
    expect(connection.use_ssl?).to eq(true)
  end

  it 'should set up the proper http ssl connection when a proxy_host and proxy_port are given' do
    twilio = Twilio::REST::Client.new('someSid', 'someToken', :host => 'api.faketwilio.com', :proxy_addr => 'localhost', :proxy_port => 13128)
    connection = twilio.instance_variable_get('@connection')
    expect(connection.proxy?).to eq(true)
    expect(connection.proxy_address).to eq('localhost')
    expect(connection.proxy_port).to eq(13128)
    expect(connection.address).to eq('api.faketwilio.com')
    expect(connection.port).to eq(443)
    expect(connection.use_ssl?).to eq(true)
  end

  it 'should set up an accounts resources object' do
    twilio = Twilio::REST::Client.new('someSid', 'someToken')
    expect(twilio).to respond_to(:accounts)
    expect(twilio.accounts.instance_variable_get('@path')).to eq('/2010-04-01/Accounts')
  end

  it 'should set up an account object with the given sid' do
    twilio = Twilio::REST::Client.new('someSid', 'someToken')
    expect(twilio).to respond_to(:account)
    expect(twilio.account.instance_variable_get('@path')).to eq('/2010-04-01/Accounts/someSid')
  end

  it 'should convert all parameter names to Twilio-style names' do
    twilio = Twilio::REST::Client.new('someSid', 'someToken')
    untwilified = {
      :sms_url => 'someUrl',
      'voiceFallbackUrl' => 'anotherUrl',
      'Status_callback' => 'yetAnotherUrl'
    }
    twilified = {
      :SmsUrl => 'someUrl',
      :VoiceFallbackUrl => 'anotherUrl',
      :StatusCallback => 'yetAnotherUrl'
    }
    expect(twilio.twilify(untwilified)).to eq(twilified)
  end
end
