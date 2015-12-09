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
    expect(payload['grants']).not_to be_nil
    expect(payload['grants'].count).to eq(0)
  end

  it 'should generate a nbf' do
    now = Time.now.to_i
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
    expect(payload['grants'].count).to eq(1)
    expect(payload['grants']['ip_messaging']).not_to be_nil
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

end
