require 'spec_helper'

describe Twilio::Resources::Pricing::VoiceList::CountryList do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should read countries" do
    it "and return 200" do
      client = Twilio::REST::PricingClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.voice.countries.list() }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::PricingClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.voice.countries.list() }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::PricingClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.voice.countries.list() }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::PricingClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.voice.countries.list() }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should fetch countries" do
    it "and return 200" do
      client = Twilio::REST::PricingClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.voice.countries.get('iso_country')
      expect { resource.sid }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::PricingClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.voice.countries.get('iso_country')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::PricingClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.voice.countries.get('iso_country')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::PricingClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.voice.countries.get('iso_country')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  end
end