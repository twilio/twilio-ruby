require 'spec_helper'

describe Twilio::Util::AccessToken do

  it 'should generate a token for no grants' do
    scat = Twilio::Util::AccessToken.new 'AC123', 'SK123','secret'
    token = scat.to_s
    expect(token).not_to be_nil
    payload, header = JWT.decode token, 'secret'

    expect(payload['iss']).to eq('SK123')
    expect(payload['sub']).to eq('AC123')
    expect(payload['exp']).not_to be_nil
    expect(payload['exp']).to be >= Time.now.to_i
    expect(payload['jti']).not_to be_nil
    expect(payload['jti']).to start_with payload['iss']
    expect(payload['nbf']).to be_nil
    expect(payload['grants']).not_to be_nil
    expect(payload['grants'].count).to eq(0)
  end

  it 'should generate a nbf' do
    now = Time.now.to_i - 1
    scat = Twilio::Util::AccessToken.new 'AC123', 'SK123','secret'
    scat.identity = 'abc'
    scat.nbf = now

    token = scat.to_s
    expect(token).not_to be_nil
    payload, header = JWT.decode token, 'secret'

    expect(payload['iss']).to eq('SK123')
    expect(payload['sub']).to eq('AC123')
    expect(payload['nbf']).not_to be_nil
    expect(payload['nbf']).to eq(now)
    expect(payload['exp']).not_to be_nil
    expect(payload['exp']).to be >= Time.now.to_i
    expect(payload['jti']).not_to be_nil
    expect(payload['jti']).to start_with payload['iss']
    expect(payload['grants']).not_to be_nil
    expect(payload['grants'].count).to eq(1)
    expect(payload['grants']['identity']).to eq('abc')
  end

  it 'should be able to add conversation grant' do
    scat = Twilio::Util::AccessToken.new 'AC123', 'SK123','secret'
    scat.add_grant(Twilio::Util::AccessToken::ConversationsGrant.new)

    token = scat.to_s
    expect(token).not_to be_nil
    payload, header = JWT.decode token, 'secret'

    expect(payload['iss']).to eq('SK123')
    expect(payload['sub']).to eq('AC123')
    expect(payload['exp']).not_to be_nil
    expect(payload['exp']).to be >= Time.now.to_i
    expect(payload['jti']).not_to be_nil
    expect(payload['jti']).to start_with payload['iss']
    expect(payload['grants']).not_to be_nil
    expect(payload['grants'].count).to eq(1)
    expect(payload['grants']['rtc']).not_to be_nil
  end

  it 'should be able to add endpoint grants' do
    scat = Twilio::Util::AccessToken.new 'AC123', 'SK123','secret'

    grant = Twilio::Util::AccessToken::IpMessagingGrant.new
    grant.push_credential_sid = 'CR123'
    grant.deployment_role_sid = 'DR123'
    grant.service_sid = 'IS123'
    grant.endpoint_id = 'EP123'
    scat.add_grant(grant)   

    token = scat.to_s
    expect(token).not_to be_nil
    payload, header = JWT.decode token, 'secret'

    expect(payload['iss']).to eq('SK123')
    expect(payload['sub']).to eq('AC123')
    expect(payload['exp']).not_to be_nil
    expect(payload['exp']).to be >= Time.now.to_i
    expect(payload['jti']).not_to be_nil
    expect(payload['jti']).to start_with payload['iss']
    expect(payload['grants']).not_to be_nil
    expect(payload['grants'].count).to eq(1)
    expect(payload['grants']['ip_messaging']).not_to be_nil
    expect(payload['grants']['ip_messaging']['service_sid']).to eq('IS123')
    expect(payload['grants']['ip_messaging']['endpoint_id']).to eq('EP123')
    expect(payload['grants']['ip_messaging']['push_credential_sid']).to eq('CR123')
    expect(payload['grants']['ip_messaging']['deployment_role_sid']).to eq('DR123')
  end

  it 'should add rest grants' do
    scat = Twilio::Util::AccessToken.new 'AC123', 'SK123','secret'
    scat.add_grant(Twilio::Util::AccessToken::ConversationsGrant.new)
    scat.add_grant(Twilio::Util::AccessToken::IpMessagingGrant.new)

    token = scat.to_s
    expect(token).not_to be_nil
    payload, header = JWT.decode token, 'secret'

    expect(payload['iss']).to eq('SK123')
    expect(payload['sub']).to eq('AC123')
    expect(payload['exp']).not_to be_nil
    expect(payload['exp']).to be >= Time.now.to_i
    expect(payload['jti']).not_to be_nil
    expect(payload['jti']).to start_with payload['iss']
    expect(payload['grants']).not_to be_nil
    expect(payload['grants'].count).to eq(2)
    expect(payload['grants']['rtc']).not_to be_nil
    expect(payload['grants']['ip_messaging']).not_to be_nil
  end

  it 'should add programmable voice grant' do
    scat = Twilio::Util::AccessToken.new 'AC123', 'SK123','secret'
    pvg = Twilio::Util::AccessToken::VoiceGrant.new
    pvg.outgoing_application_sid = 'AP123'
    pvg.outgoing_application_params = { :foo => 'bar' }

    scat.add_grant(pvg)

    token = scat.to_s
    expect(token).not_to be_nil
    payload, header = JWT.decode token, 'secret'

    expect(payload['iss']).to eq('SK123')
    expect(payload['sub']).to eq('AC123')
    expect(payload['exp']).not_to be_nil
    expect(payload['exp']).to be >= Time.now.to_i
    expect(payload['jti']).not_to be_nil
    expect(payload['jti']).to start_with payload['iss']
    expect(payload['grants']).not_to be_nil
    expect(payload['grants'].count).to eq(1)
    expect(payload['grants']['voice']).not_to be_nil
    expect(payload['grants']['voice']['outgoing']['application_sid']).to eq('AP123')
    expect(payload['grants']['voice']['outgoing']['params']['foo']).to eq('bar')
  end

  it 'should add video grant' do
    scat = Twilio::Util::AccessToken.new 'AC123', 'SK123','secret'
    vg = Twilio::Util::AccessToken::VideoGrant.new
    vg.configuration_profile_sid = 'CP123'

    scat.add_grant(vg)

    token = scat.to_s
    expect(token).not_to be_nil
    payload, header = JWT.decode token, 'secret'

    expect(payload['iss']).to eq('SK123')
    expect(payload['sub']).to eq('AC123')
    expect(payload['exp']).not_to be_nil
    expect(payload['exp']).to be >= Time.now.to_i
    expect(payload['jti']).not_to be_nil
    expect(payload['jti']).to start_with payload['iss']
    expect(payload['grants']).not_to be_nil
    expect(payload['grants'].count).to eq(1)
    expect(payload['grants']['video']).not_to be_nil
    expect(payload['grants']['video']['configuration_profile_sid']).to eq('CP123')
  end
end
