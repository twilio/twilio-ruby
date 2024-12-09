require 'rspec/matchers'
require 'twilio-ruby'
require './lib/twilio-ruby/credential/client_credential_provider'

describe 'Cluster Test' do
  before(:each) do
    @client_secret = ENV['TWILIO_ORGS_CLIENT_SECRET']
    @client_id = ENV['TWILIO_ORGS_CLIENT_ID']
    @org_sid = ENV['TWILIO_ORG_SID']
    @user_sid = ENV['TWILIO_USER_SID']
    @credential = Twilio::REST::ClientCredentialProvider.new(@client_id, @client_secret)
    @client = Twilio::REST::Client.new.credential_provider(@credential)
  end

  it 'can send a text' do
    response = @client.preview_iam.organizations(@org_sid).accounts.list
    expect(response).to_not be_nil
    response.each do |element|
      expect(element.account_sid).to_not be_nil
      expect(element.friendly_name).to_not be_nil
      expect(element.status).to_not be_nil
      expect(element.owner_sid).to_not be_nil
      expect(element.date_created).to_not be_nil
    end
  end

  it 'can fetch specific account' do
    response = @client.preview_iam.organizations(@org_sid).accounts(@account_sid).fetch
    expect(response).to_not be_nil
    expect(response.account_sid).to eq(@account_sid)
    expect(response.friendly_name).to_not be_nil
    expect(response.status).to_not be_nil
    expect(response.owner_sid).to_not be_nil
    expect(response.date_created).to_not be_nil
  end

  it 'can access role assignments list' do
    response = @client.preview_iam.organizations(@org_sid).role_assignments.list(scope: @account_sid)
    expect(response).to_not be_nil
    response.each do |element|
      expect(element.sid).to_not be_nil
      expect(element.role_sid).to_not be_nil
      expect(element.scope).to_not be_nil
      expect(element.identity).to_not be_nil
    end
  end

  it 'can get user list' do
    response = @client.preview_iam.organizations(@org_sid).users.list
    expect(response).to_not be_nil
    response.each do |element|
      expect(element.id).to_not be_nil
    end
  end

  it 'can get single user' do
    response = @client.preview_iam.organizations(@org_sid).users(@user_sid).fetch
    expect(response).to_not be_nil
    expect(response.id).to eq(@user_sid)
    expect(response.emails[0]['value']).to_not be_nil
    expect(response.emails[0]['type']).to_not be_nil
  end
end
