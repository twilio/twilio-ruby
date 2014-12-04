require 'spec_helper'

describe Twilio::REST::Address do
  it 'should set up a dependent phone numbers resources object' do
    address = Twilio::REST::Address.new('someUri', 'someClient')
    expect(address).to respond_to(:dependent_phone_numbers)
    expect(address.dependent_phone_numbers.instance_variable_get('@path')).to eq(
      'someUri/DependentPhoneNumbers'
    )
  end
end
