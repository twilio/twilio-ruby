require 'spec_helper'

describe Twilio::Util::Capability do
  before :each do
    @capability = Twilio::Util::Capability.new 'myAccountSid', 'myAuthToken'
  end

  def queries(q)
    q.scan(/scope:client:(incoming|outgoing)\?(\S+)/).map{|(type, query)| [type, Rack::Utils.parse_query(query)]}
  end

  it 'should return a valid jwt when #generate is called' do
    token = @capability.generate
    decoded, header = JWT.decode token, 'myAuthToken'
    expect(decoded['scope']).not_to be_nil
    expect(decoded['iss']).not_to be_nil
    expect(decoded['exp']).not_to be_nil
  end

  it 'should properly set the iss key in the payload' do
    token = @capability.generate
    decoded, header = JWT.decode token, 'myAuthToken'
    expect(decoded['iss']).to eq('myAccountSid')
  end

  it 'should properly set the exp key based on the default hour ttl' do
    seconds = Time.now.to_i
    token = @capability.generate
    decoded, header = JWT.decode token, 'myAuthToken'
    expect(decoded['exp']).to eq(seconds + 3600)
  end

  it 'should properly set the exp key based on the ttl passed to #generate' do
    ttl = rand 10000
    seconds = Time.now.to_i
    token = @capability.generate ttl
    decoded, header = JWT.decode token, 'myAuthToken'
    expect(decoded['exp']).to eq(seconds + ttl)
  end

  it 'should generate a proper incoming client scope string' do
    @capability.allow_client_incoming 'andrew'
    token = @capability.generate
    decoded, header = JWT.decode token, 'myAuthToken'
    expect(queries(decoded['scope'])).to eq([['incoming', {'clientName' => 'andrew'}]])
  end

  it 'should generate multiple proper incoming client scope strings' do
    @capability.allow_client_incoming 'andrew'
    @capability.allow_client_incoming 'bridget'
    token = @capability.generate
    decoded, header = JWT.decode token, 'myAuthToken'
    expect(queries(decoded['scope'])).to eq([
      ['incoming', {'clientName' => 'andrew'}],
      ['incoming', {'clientName' => 'bridget'}]
    ])
  end

  it 'should generate a proper outgoing client scope string' do
    @capability.allow_client_outgoing 'myAppSid'
    token = @capability.generate
    decoded, header = JWT.decode token, 'myAuthToken'
    expect(queries(decoded['scope'])).to eq([['outgoing', {'appSid' => 'myAppSid'}]])
  end

  it 'should generate a proper outgoing client scope string with parameters' do
    app_params_hash = {'key' => 'a value', :foo => 'bar/baz'}
    @capability.allow_client_outgoing 'myAppSid', app_params_hash
    app_params = @capability.instance_eval {url_encode(app_params_hash)}
    params_hash = {'appSid' => 'myAppSid', 'appParams' => app_params}
    @capability.instance_eval {url_encode(params_hash)}
    token = @capability.generate
    decoded, header= JWT.decode token, 'myAuthToken'
    expect(queries(decoded['scope'])).to eq([['outgoing', params_hash]])
  end

  it 'should generate a proper outgoing client scope string based on the ' +
       'client name when calling #allow_client_incoming first' do
    @capability.allow_client_incoming 'andrew'
    @capability.allow_client_outgoing 'myAppSid'
    token = @capability.generate
    decoded, header = JWT.decode token, 'myAuthToken'
    expect(queries(decoded['scope'])).to eq([
      ['incoming', {'clientName' => 'andrew'}],
      ['outgoing', {'clientName' => 'andrew', 'appSid' => 'myAppSid'}]
    ])
  end

  it 'should generate a proper outgoing client scope string based on the ' +
       'client name when calling #allow_client_incoming second' do
    @capability.allow_client_outgoing 'myAppSid'
    @capability.allow_client_incoming 'andrew'
    token = @capability.generate
    decoded, header = JWT.decode token, 'myAuthToken'
    expect(queries(decoded['scope'])).to eq([["incoming", {"clientName"=>"andrew"}], ["outgoing", {"clientName"=>"andrew", "appSid"=>"myAppSid"}]])
  end

  it 'should generate a proper outgoing client scope string with parameters ' +
       'and a client name when calling #allow_client_incoming first' do
    @capability.allow_client_incoming 'andrew'
    app_params_hash = {'key' => 'a value', :foo => 'bar/baz'}
    @capability.allow_client_outgoing 'myAppSid', app_params_hash
    app_params = @capability.instance_eval {url_encode(app_params_hash)}
    params_hash = {'appSid' => 'myAppSid', 'appParams' => app_params, 'clientName' => 'andrew'}
    @capability.instance_eval {url_encode(params_hash)}
    token = @capability.generate
    decoded, header = JWT.decode token, 'myAuthToken'
    scopes = queries(decoded['scope'])
    expect(scopes.shift).to eq(["incoming", {"clientName"=>"andrew"}])
    scope = scopes.shift
    expect(scope.first).to eq('outgoing')
    expect(Rack::Utils.parse_query(scope.last['appParams'])).to eq({'key' => 'a value', 'foo' => 'bar/baz'})
    expect(scope.last["clientName"]).to eq("andrew")
    expect(scope.last["appSid"]).to eq("myAppSid")
    expect(scopes).to be_empty
  end

  it 'should generate a proper outgoing client scope string with parameters ' +
       'and a client name when calling #allow_client_incoming second' do
    app_params_hash = {'key' => 'a value', :foo => 'bar/baz'}
    @capability.allow_client_outgoing 'myAppSid', app_params_hash
    @capability.allow_client_incoming 'andrew'
    app_params = @capability.instance_eval {url_encode(app_params_hash)}
    params_hash = {'appSid' => 'myAppSid', 'appParams' => app_params, 'clientName' => 'andrew'}
    @capability.instance_eval {url_encode(params_hash)}
    token = @capability.generate
    decoded, header = JWT.decode token, 'myAuthToken'
    scopes = queries(decoded['scope'])
    expect(scopes.shift).to eq(["incoming", {"clientName"=>"andrew"}])
    scope = scopes.shift
    expect(scope.first).to eq('outgoing')
    expect(Rack::Utils.parse_query(scope.last['appParams'])).to eq({'key' => 'a value', 'foo' => 'bar/baz'})
    expect(scope.last["clientName"]).to eq("andrew")
    expect(scope.last["appSid"]).to eq("myAppSid")
    expect(scopes).to be_empty
  end
end
