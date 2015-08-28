require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::IncomingPhoneNumberList::LocalList do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should read incoming_phone_numbers" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').incoming_phone_numbers.local.list(phone_number: 'phone_number', beta: true, friendly_name: 'friendly_name') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.accounts.get('ACllllllllllllllllllllllllllllllll').incoming_phone_numbers.local.list(phone_number: 'phone_number', beta: true, friendly_name: 'friendly_name') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').incoming_phone_numbers.local.list(phone_number: 'phone_number', beta: true, friendly_name: 'friendly_name') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').incoming_phone_numbers.local.list(phone_number: 'phone_number', beta: true, friendly_name: 'friendly_name') }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should create incoming_phone_numbers" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').incoming_phone_numbers.local.create(phone_number: 'phone_number', api_version: 'api_version', friendly_name: 'friendly_name', voice_fallback_method: "GET", voice_fallback_url: "https://example.com", sms_method: "GET", status_callback_method: "GET", sms_url: "https://example.com", voice_url: "https://example.com", sms_fallback_method: "GET", sms_application_sid: 'sms_application_sid', voice_caller_id_lookup: true, voice_method: "GET", voice_application_sid: 'voice_application_sid', sms_fallback_url: "https://example.com", status_callback: "https://example.com", area_code: 'area_code') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.accounts.get('ACllllllllllllllllllllllllllllllll').incoming_phone_numbers.local.create(phone_number: 'phone_number', api_version: 'api_version', friendly_name: 'friendly_name', voice_fallback_method: "GET", voice_fallback_url: "https://example.com", sms_method: "GET", status_callback_method: "GET", sms_url: "https://example.com", voice_url: "https://example.com", sms_fallback_method: "GET", sms_application_sid: 'sms_application_sid', voice_caller_id_lookup: true, voice_method: "GET", voice_application_sid: 'voice_application_sid', sms_fallback_url: "https://example.com", status_callback: "https://example.com", area_code: 'area_code') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').incoming_phone_numbers.local.create(phone_number: 'phone_number', api_version: 'api_version', friendly_name: 'friendly_name', voice_fallback_method: "GET", voice_fallback_url: "https://example.com", sms_method: "GET", status_callback_method: "GET", sms_url: "https://example.com", voice_url: "https://example.com", sms_fallback_method: "GET", sms_application_sid: 'sms_application_sid', voice_caller_id_lookup: true, voice_method: "GET", voice_application_sid: 'voice_application_sid', sms_fallback_url: "https://example.com", status_callback: "https://example.com", area_code: 'area_code') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').incoming_phone_numbers.local.create(phone_number: 'phone_number', api_version: 'api_version', friendly_name: 'friendly_name', voice_fallback_method: "GET", voice_fallback_url: "https://example.com", sms_method: "GET", status_callback_method: "GET", sms_url: "https://example.com", voice_url: "https://example.com", sms_fallback_method: "GET", sms_application_sid: 'sms_application_sid', voice_caller_id_lookup: true, voice_method: "GET", voice_application_sid: 'voice_application_sid', sms_fallback_url: "https://example.com", status_callback: "https://example.com", area_code: 'area_code') }.to raise_error Twilio::REST::RequestError
    end
  end
end