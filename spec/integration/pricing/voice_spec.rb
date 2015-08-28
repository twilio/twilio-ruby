require 'spec_helper'

describe Twilio::Resources::Pricing::VoiceList do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should fetch None" do
    it "and return 200" do
      client = Twilio::REST::PricingClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.voice.get()
      expect { resource.sid }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::PricingClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.voice.get()
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::PricingClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.voice.get()
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::PricingClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.voice.get()
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  end
end