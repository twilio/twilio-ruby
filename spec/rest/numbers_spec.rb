require 'spec_helper'

describe Twilio::REST::Country do

  before do
    @country = Twilio::REST::Country.new('someUri', 'someClient')
  end

  it 'sets up a local resources object' do
    @country.should respond_to(:local)
    @country.local.instance_variable_get('@path').should == 'someUri/Local'
  end

  it 'sets up a toll_free resources object' do
    @country.should respond_to(:toll_free)
    @country.toll_free.instance_variable_get('@path').should == 'someUri/TollFree'
  end

  it 'sets up a mobile resources object' do
    @country.should respond_to(:mobile)
    @country.mobile.instance_variable_get('@path').should == 'someUri/Mobile'
  end

end
