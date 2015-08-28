require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::AddressInstance::DependentPhoneNumberList do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should read dependent_phone_numbers" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').addresses.get('ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').dependent_phone_numbers.list() }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.accounts.get('ACllllllllllllllllllllllllllllllll').addresses.get('ADllllllllllllllllllllllllllllllll').dependent_phone_numbers.list() }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').addresses.get('ADkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').dependent_phone_numbers.list() }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').addresses.get('ADmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').dependent_phone_numbers.list() }.to raise_error Twilio::REST::RequestError
    end
  end
end