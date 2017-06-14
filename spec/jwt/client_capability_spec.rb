require 'spec_helper'

describe Twilio::JWT::ClientCapability do
  describe 'initialization' do
    it 'should initialize without optionals' do
      clientCapability = Twilio::JWT::ClientCapability.new 'accountSid', 'authToken'

      expect(clientCapability.instance_variable_get('@account_sid')).to eq('accountSid')
      expect(clientCapability.instance_variable_get('@auth_token')).to eq('authToken')
      expect(clientCapability.instance_variable_get('@client_name')).to be_nil
      expect(clientCapability.instance_variable_get('@capabilities')).to eq({})
    end
  end

  describe 'capabilities' do
    before :each do
      @clientCapability = Twilio::JWT::ClientCapability.new 'accountSid', 'authToken'
    end

    it 'no capabilities' do
      expect(@clientCapability.__send__(:_generate_payload)[:scope]).to eq('')
    end

    it 'allow_client_outgoing without params' do
      @clientCapability.allow_client_outgoing('test-application-sid')
      escope = 'scope:client:outgoing?appSid=test-application-sid'
      expect(@clientCapability.__send__(:_generate_payload)[:scope]).to eq(escope)
    end

    it 'allow_client_outgoing with params' do
      @clientCapability.allow_client_outgoing('test-application-sid', {'params_key'=>'param_value'})
      escope = 'scope:client:outgoing?appSid=test-application-sid?params_key=param_value'
      expect(@clientCapability.__send__(:_generate_payload)[:scope]).to eq(escope)
    end

    it 'allow_client_incoming with params' do
      @clientCapability.allow_client_incoming('test-client-name')
      escope = 'scope:client:incoming?clientName=test-client-name'
      expect(@clientCapability.__send__(:_generate_payload)[:scope]).to eq(escope)
    end

    it 'allow_event_stream' do
      @clientCapability.allow_event_stream
      escope = 'scope:stream:subscribe?path=/2010-04-01/Events'
      expect(@clientCapability.__send__(:_generate_payload)[:scope]).to eq(escope)
    end

    it 'allow_event_stream with filters' do
      @clientCapability.allow_event_stream({'param_key'=>'param_value'})
      escope = 'scope:stream:subscribe?path=/2010-04-01/Events?param_key=param_value'
      expect(@clientCapability.__send__(:_generate_payload)[:scope]).to eq(escope)
    end

    it 'allow_client_ incoming and outgoing' do
      @clientCapability.allow_client_outgoing('test-application-sid')
      @clientCapability.allow_client_incoming('test-client-name')
      escope = 'scope:client:outgoing?appSid=test-application-sid?clientName=test-client-name scope:client:incoming?clientName=test-client-name'
      expect(@clientCapability.__send__(:_generate_payload)[:scope]).to eq(escope)
    end

    it 'complete payload' do
      @clientCapability.allow_client_incoming('test-client-name')
      payload, _ = ::JWT.decode @clientCapability.to_s, 'authToken', true, {:algorithm=>'HS256'}
      escope = 'scope:client:incoming?clientName=test-client-name'
      expect(payload['iss']).to eq('accountSid')
      expect(payload['scope']).to eq(escope)
      expect(payload['exp']).to be > Time.now.to_i
      expect(payload['nbf']).to be <= Time.now.to_i
    end
  end
end

describe Twilio::JWT::ScopeURI do
  describe 'payload formatted properly' do
    it 'payload without params' do
      scopeUri = Twilio::JWT::ScopeURI.new('service-test', 'privilege-test')
      expect(scopeUri.payload).to eq('scope:service-test:privilege-test')
    end

    it 'payload with params' do
      scopeUri = Twilio::JWT::ScopeURI.new('service-test', 'privilege-test', param_key: 'param_value')
      expect(scopeUri.payload).to eq('scope:service-test:privilege-test?param_key=param_value')
    end
  end
end