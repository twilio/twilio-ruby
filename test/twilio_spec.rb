$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
require 'twilio-ruby'
require 'fakeweb'
require 'rack'

describe Twilio::REST::Client do
  before :all do
    FakeWeb.register_uri(:any, %r/http:\/\/api.twilio.com\//, :body => '{"message": "You tried to reach Twilio"}')
  end

  it 'should set up a new client instance with the given sid and token' do
    twilio = Twilio::REST::Client.new('someSid', 'someToken')
    twilio.account_sid.should == 'someSid'
    twilio.instance_variable_get('@auth_token').should == 'someToken'
  end
  
  it 'should set up the proper default http ssl connection' do
    twilio = Twilio::REST::Client.new('someSid', 'someToken')
    twilio.instance_variable_get('@connection').address.should == 'api.twilio.com'
    twilio.instance_variable_get('@connection').port.should == 443
    twilio.instance_variable_get('@connection').use_ssl?.should == true
  end
  
  it 'should set up the proper http ssl connection when a different domain is given' do
    twilio = Twilio::REST::Client.new('someSid', 'someToken', :host => 'api.faketwilio.com')
    twilio.instance_variable_get('@connection').address.should == 'api.faketwilio.com'
    twilio.instance_variable_get('@connection').port.should == 443
    twilio.instance_variable_get('@connection').use_ssl?.should == true
  end

  it 'should set up the proper http ssl connection when a proxy_host is given' do
    twilio = Twilio::REST::Client.new('someSid', 'someToken', :host => 'api.faketwilio.com', :proxy_addr => 'localhost')
    twilio.instance_variable_get('@connection').proxy?.should == true
    twilio.instance_variable_get('@connection').proxy_address.should == 'localhost'
    twilio.instance_variable_get('@connection').proxy_port.should == 80
    twilio.instance_variable_get('@connection').address.should == 'api.faketwilio.com'
    twilio.instance_variable_get('@connection').port.should == 443
    twilio.instance_variable_get('@connection').use_ssl?.should == true
  end

  it 'should set up the proper http ssl connection when a proxy_host and proxy_port are given' do
    twilio = Twilio::REST::Client.new('someSid', 'someToken', :host => 'api.faketwilio.com', :proxy_addr => 'localhost', :proxy_port => 13128)
    twilio.instance_variable_get('@connection').proxy?.should == true
    twilio.instance_variable_get('@connection').proxy_address.should == 'localhost'
    twilio.instance_variable_get('@connection').proxy_port.should == 13128
    twilio.instance_variable_get('@connection').address.should == 'api.faketwilio.com'
    twilio.instance_variable_get('@connection').port.should == 443
    twilio.instance_variable_get('@connection').use_ssl?.should == true
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

describe Twilio::REST::InstanceResource do
  it 'should set up an internal reference to the uri and client' do
    resource = Twilio::REST::InstanceResource.new('some/uri', 'someClient')
    resource.instance_variable_get('@uri').should == 'some/uri'
    resource.instance_variable_get('@client').should == 'someClient'
  end

  it 'should set up object properties if passed' do
    params = {'SomeKey' => 'someValue'}
    resource = Twilio::REST::InstanceResource.new('uri', 'client', params)
    resource.some_key.should == 'someValue'
  end
end

describe Twilio::REST::Account do
  it 'should set up an incoming phone numbers resources object' do
    account = Twilio::REST::Account.new('someUri', 'someClient')
    account.respond_to?(:incoming_phone_numbers).should == true
    account.incoming_phone_numbers.instance_variable_get('@uri').should == 'someUri/IncomingPhoneNumbers'
  end

  it 'should set up an available phone numbers resources object' do
    account = Twilio::REST::Account.new('someUri', 'someClient')
    account.respond_to?(:available_phone_numbers).should == true
    account.available_phone_numbers.instance_variable_get('@uri').should == 'someUri/AvailablePhoneNumbers'
  end

  it 'should set up an outgoing caller ids resources object' do
    account = Twilio::REST::Account.new('someUri', 'someClient')
    account.respond_to?(:outgoing_caller_ids).should == true
    account.outgoing_caller_ids.instance_variable_get('@uri').should == 'someUri/OutgoingCallerIds'
  end

  it 'should set up a calls resources object' do
    account = Twilio::REST::Account.new('someUri', 'someClient')
    account.respond_to?(:calls).should == true
    account.calls.instance_variable_get('@uri').should == 'someUri/Calls'
  end

  it 'should set up a conferences resources object' do
    account = Twilio::REST::Account.new('someUri', 'someClient')
    account.respond_to?(:conferences).should == true
    account.conferences.instance_variable_get('@uri').should == 'someUri/Conferences'
  end

  it 'should set up a sms resource object' do
    account = Twilio::REST::Account.new('someUri', 'someClient')
    account.respond_to?(:sms).should == true
    account.sms.instance_variable_get('@uri').should == 'someUri/SMS'
  end

  it 'should set up a recordings resources object' do
    account = Twilio::REST::Account.new('someUri', 'someClient')
    account.respond_to?(:recordings).should == true
    account.recordings.instance_variable_get('@uri').should == 'someUri/Recordings'
  end

  it 'should set up a transcriptions resources object' do
    account = Twilio::REST::Account.new('someUri', 'someClient')
    account.respond_to?(:transcriptions).should == true
    account.transcriptions.instance_variable_get('@uri').should == 'someUri/Transcriptions'
  end

  it 'should set up a notifications resources object' do
    account = Twilio::REST::Account.new('someUri', 'someClient')
    account.respond_to?(:notifications).should == true
    account.notifications.instance_variable_get('@uri').should == 'someUri/Notifications'
  end
end

describe Twilio::REST::Call do
  it 'should set up a recordings resources object' do
    call = Twilio::REST::Call.new('someUri', 'someClient')
    call.respond_to?(:recordings).should == true
    call.recordings.instance_variable_get('@uri').should == 'someUri/Recordings'
  end

  it 'should set up a recordings resources object' do
    call = Twilio::REST::Call.new('someUri', 'someClient')
    call.respond_to?(:transcriptions).should == true
    call.transcriptions.instance_variable_get('@uri').should == 'someUri/Transcriptions'
  end
end

describe Twilio::REST::Conference do
  it 'should set up a participants resources object' do
    call = Twilio::REST::Conference.new('someUri', 'someClient')
    call.respond_to?(:participants).should == true
    call.participants.instance_variable_get('@uri').should == 'someUri/Participants'
  end
end

describe Twilio::REST::Recording do
  it 'should set up a transcriptions resources object' do
    call = Twilio::REST::Recording.new('someUri', 'someClient')
    call.respond_to?(:transcriptions).should == true
    call.transcriptions.instance_variable_get('@uri').should == 'someUri/Transcriptions'
  end
end

describe Twilio::Util::RequestValidator do
  it 'should properly validate a Twilio request based on its signature' do
    token = '1c892n40nd03kdnc0112slzkl3091j20'
    validator = Twilio::Util::RequestValidator.new token
    url = 'http://www.postbin.org/1ed898x'
    params = {
      'AccountSid' => 'AC9a9f9392lad99kla0sklakjs90j092j3',
      'ApiVersion' => '2010-04-01',
      'CallSid' => 'CAd800bb12c0426a7ea4230e492fef2a4f',
      'CallStatus' => 'ringing',
      'Called' => '+15306384866',
      'CalledCity' => 'OAKLAND',
      'CalledCountry' => 'US',
      'CalledState' => 'CA',
      'CalledZip' => '94612',
      'Caller' => '+15306666666',
      'CallerCity' => 'SOUTH LAKE TAHOE',
      'CallerCountry' => 'US',
      'CallerName' => 'CA Wireless Call',
      'CallerState' => 'CA',
      'CallerZip' => '89449',
      'Direction' => 'inbound',
      'From' => '+15306666666',
      'FromCity' => 'SOUTH LAKE TAHOE',
      'FromCountry' => 'US',
      'FromState' => 'CA',
      'FromZip' => '89449',
      'To' => '+15306384866',
      'ToCity' => 'OAKLAND',
      'ToCountry' => 'US',
      'ToState' => 'CA',
      'ToZip' => '94612'
    }
    signature = 'fF+xx6dTinOaCdZ0aIeNkHr/ZAA='
    validator.validate(url, params, signature).should == true
  end
end

describe Twilio::Util::Capability do
  before :each do
    @capability = Twilio::Util::Capability.new 'myAccountSid', 'myAuthToken'
  end

  def queries(q)
    q.scan(/scope:client:(incoming|outgoing)\?(\S+)/).map{|(type, query)| [type, Rack::Utils.parse_query(query)]}
  end

  it 'should return a valid jwt when #generate is called' do
    token = @capability.generate
    decoded = JWT.decode token, 'myAuthToken'
    decoded['scope'].should_not be_nil
    decoded['iss'].should_not be_nil
    decoded['exp'].should_not be_nil
  end

  it 'should properly set the iss key in the payload' do
    token = @capability.generate
    decoded = JWT.decode token, 'myAuthToken'
    decoded['iss'].should == 'myAccountSid'
  end

  it 'should properly set the exp key based on the default hour ttl' do
    seconds = Time.now.to_i
    token = @capability.generate
    decoded = JWT.decode token, 'myAuthToken'
    decoded['exp'].should == seconds + 3600
  end

  it 'should properly set the exp key based on the ttl passed to #generate' do
    ttl = rand 10000
    seconds = Time.now.to_i
    token = @capability.generate ttl
    decoded = JWT.decode token, 'myAuthToken'
    decoded['exp'].should == seconds + ttl
  end

  it 'should generate a proper incoming client scope string' do
    @capability.allow_client_incoming 'andrew'
    token = @capability.generate
    decoded = JWT.decode token, 'myAuthToken'
    queries(decoded['scope']).should == [['incoming', {'clientName' => 'andrew'}]]
  end

  it 'should generate multiple proper incoming client scope strings' do
    @capability.allow_client_incoming 'andrew'
    @capability.allow_client_incoming 'bridget'
    token = @capability.generate
    decoded = JWT.decode token, 'myAuthToken'
    queries(decoded['scope']).should == [
      ['incoming', {'clientName' => 'andrew'}],
      ['incoming', {'clientName' => 'bridget'}]
    ]
  end

  it 'should generate a proper outgoing client scope string' do
    @capability.allow_client_outgoing 'myAppSid'
    token = @capability.generate
    decoded = JWT.decode token, 'myAuthToken'
    queries(decoded['scope']).should == [['outgoing', {'appSid' => 'myAppSid'}]]
  end

  it 'should generate a proper outgoing client scope string with parameters' do
    app_params_hash = {'key' => 'a value', :foo => 'bar/baz'}
    @capability.allow_client_outgoing 'myAppSid', app_params_hash
    app_params = @capability.instance_eval {url_encode(app_params_hash)}
    params_hash = {'appSid' => 'myAppSid', 'appParams' => app_params}
    params = @capability.instance_eval {url_encode(params_hash)}
    token = @capability.generate
    decoded = JWT.decode token, 'myAuthToken'
    queries(decoded['scope']).should == [['outgoing', params_hash]]
  end

  it 'should generate a proper outgoing client scope string based on the ' +
    'client name when calling #allow_client_incoming first' do
    @capability.allow_client_incoming 'andrew'
    @capability.allow_client_outgoing 'myAppSid'
    token = @capability.generate
    decoded = JWT.decode token, 'myAuthToken'
    queries(decoded['scope']).should == [
      ['incoming', {'clientName' => 'andrew'}],
      ['outgoing', {'clientName' => 'andrew', 'appSid' => 'myAppSid'}]
    ]
  end

  it 'should generate a proper outgoing client scope string based on the ' +
    'client name when calling #allow_client_incoming second' do
    @capability.allow_client_outgoing 'myAppSid'
    @capability.allow_client_incoming 'andrew'
    token = @capability.generate
    decoded = JWT.decode token, 'myAuthToken'
    queries(decoded['scope']).should == [["incoming", {"clientName"=>"andrew"}], ["outgoing", {"clientName"=>"andrew", "appSid"=>"myAppSid"}]]
  end

  it 'should generate a proper outgoing client scope string with parameters ' +
    'and a client name when calling #allow_client_incoming first' do
    @capability.allow_client_incoming 'andrew'
    app_params_hash = {'key' => 'a value', :foo => 'bar/baz'}
    @capability.allow_client_outgoing 'myAppSid', app_params_hash
    app_params = @capability.instance_eval {url_encode(app_params_hash)}
    params_hash = {'appSid' => 'myAppSid', 'appParams' => app_params, 'clientName' => 'andrew'}
    params = @capability.instance_eval {url_encode(params_hash)}
    token = @capability.generate
    decoded = JWT.decode token, 'myAuthToken'
    scopes = queries(decoded['scope'])
    scopes.shift.should == ["incoming", {"clientName"=>"andrew"}]
    scope = scopes.shift
    scope.first.should == 'outgoing'
    Rack::Utils.parse_query(scope.last['appParams']).should == {'key' => 'a value', 'foo' => 'bar/baz'}
    scope.last["clientName"].should == "andrew"
    scope.last["appSid"].should == "myAppSid"
    scopes.should be_empty
  end

  it 'should generate a proper outgoing client scope string with parameters ' +
    'and a client name when calling #allow_client_incoming second' do
    app_params_hash = {'key' => 'a value', :foo => 'bar/baz'}
    @capability.allow_client_outgoing 'myAppSid', app_params_hash
    @capability.allow_client_incoming 'andrew'
    app_params = @capability.instance_eval {url_encode(app_params_hash)}
    params_hash = {'appSid' => 'myAppSid', 'appParams' => app_params, 'clientName' => 'andrew'}
    params = @capability.instance_eval {url_encode(params_hash)}
    token = @capability.generate
    decoded = JWT.decode token, 'myAuthToken'
    scopes = queries(decoded['scope'])
    scopes.shift.should == ["incoming", {"clientName"=>"andrew"}]
    scope = scopes.shift
    scope.first.should == 'outgoing'
    Rack::Utils.parse_query(scope.last['appParams']).should == {'key' => 'a value', 'foo' => 'bar/baz'}
    scope.last["clientName"].should == "andrew"
    scope.last["appSid"].should == "myAppSid"
    scopes.should be_empty
  end
end
