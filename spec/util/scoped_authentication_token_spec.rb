require 'spec_helper'

describe Twilio::Util::ScopedAuthenticationToken do

  it 'should be able to add a grant' do
    grant = Twilio::Util::Grant.new 'https://api.twilio.com/**', [Twilio::Util::Action::ALL]
    scoped_auth_token = Twilio::Util::ScopedAuthenticationToken.new 'SK123', 'AC123', 'Token1', 3600, [grant]
    new_grant = Twilio::Util::Grant.new 'https://taskrouter.twilio.com/**', [Twilio::Util::Action::GET]
    grants = scoped_auth_token.add_grant new_grant

    expect(grants).not_to be_nil
    expect(grants.count).to eq(2)
  end

  it 'should generate a token' do
    grant = Twilio::Util::Grant.new 'https://api.twilio.com/**', [Twilio::Util::Action::ALL]
    scoped_auth_token = Twilio::Util::ScopedAuthenticationToken.new 'SK123', 'AC123', 'Token1', 3600, [grant]
    token = scoped_auth_token.generate_token 'secret'

    expect(token).not_to be_nil

    payload, header = JWT.decode token, 'secret'

    expect(payload['jti']).to eq('Token1')
    expect(payload['iss']).to eq('SK123')
    expect(payload['sub']).to eq('AC123')
    expect(payload['nbf']).not_to be_nil
    expect(payload['exp']).not_to be_nil
    expect(payload['exp']).to eq(payload['nbf'] + 3600)
    expect(payload['grants']).to_not be_nil
    expect(payload['grants'][0]['res']).to eq('https://api.twilio.com/**')
    expect(payload['grants'][0]['act'][0]).to eq('*')
  end

  it 'should generate a token without a grant' do
    scoped_auth_token = Twilio::Util::ScopedAuthenticationToken.new 'SK123', 'AC123', 'Token1', 3600
    token = scoped_auth_token.generate_token 'secret'

    expect(token).not_to be_nil

    payload, header = JWT.decode token, 'secret'

    expect(payload['jti']).to eq('Token1')
    expect(payload['iss']).to eq('SK123')
    expect(payload['sub']).to eq('AC123')
    expect(payload['nbf']).not_to be_nil
    expect(payload['exp']).not_to be_nil
    expect(payload['exp']).to eq(payload['nbf'] + 3600)
    expect(payload['grants']).to_not be_nil
    expect(payload['grants'].count).to eq(0)
  end

  it 'should generate a token' do
    grant = Twilio::Util::Grant.new 'https://api.twilio.com/**', [Twilio::Util::Action::ALL]
    scoped_auth_token = Twilio::Util::ScopedAuthenticationToken.new 'SK123', 'AC123', nil, 3600, [grant]
    token = scoped_auth_token.generate_token 'secret'

    expect(token).not_to be_nil

    payload, header = JWT.decode token, 'secret'

    expect(payload['jti']).not_to be_nil
    expect(payload['iss']).to eq('SK123')
    expect(payload['sub']).to eq('AC123')
    expect(payload['nbf']).not_to be_nil
    expect(payload['exp']).not_to be_nil
    expect(payload['exp']).to eq(payload['nbf'] + 3600)
    expect(payload['grants']).to_not be_nil
    expect(payload['grants'][0]['res']).to eq('https://api.twilio.com/**')
    expect(payload['grants'][0]['act'][0]).to eq('*')
  end

end
