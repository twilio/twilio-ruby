require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance do
  before do
    @instance = Twilio::Resources::V2010::AccountInstance.new('someClient')
  end

  [
    :addresses,
    :applications,
    :authorized_connect_apps,
    :available_phone_numbers,
    :calls,
    :conferences,
    :connect_apps,
    :incoming_phone_numbers,
    :messages,
    :notifications,
    :outgoing_caller_ids,
    :queues,
    :recordings,
    :sandbox,
    :sip,
    :sms,
    :tokens,
    :transcriptions,
    :usage
  ].each do |symbol|
    it "sets up #{symbol.to_s} dependent" do
      expect(@instance).to respond_to(symbol)
    end
  end
end