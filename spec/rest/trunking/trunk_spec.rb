require 'spec_helper'

describe Twilio::REST::Trunking::Trunk do

  before do
    @trunk = Twilio::REST::Trunking::Trunk.new('someUri', 'someClient')
  end

  it 'sets up a credential lists resources object' do
    expect(@trunk).to respond_to(:credential_lists)
    expect(@trunk.credential_lists.instance_variable_get('@path')).to eq(
      'someUri/CredentialLists'
    )
  end

  it 'sets up a ip access control lists resources object' do
    expect(@trunk).to respond_to(:ip_access_control_lists)
    expect(@trunk.ip_access_control_lists.instance_variable_get('@path')).to eq(
      'someUri/IpAccessControlLists'
    )
  end

  it 'sets up a origination urls resources object' do
    expect(@trunk).to respond_to(:origination_urls)
    expect(@trunk.origination_urls.instance_variable_get('@path')).to eq(
      'someUri/OriginationUrls'
    )
  end

  it 'sets up a phone numbers resources object' do
    expect(@trunk).to respond_to(:phone_numbers)
    expect(@trunk.phone_numbers.instance_variable_get('@path')).to eq(
      'someUri/PhoneNumbers'
    )
  end
end
