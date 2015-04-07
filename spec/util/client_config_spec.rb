require 'spec_helper'

describe Twilio::Util::ClientConfig do
  Twilio::Util::ClientConfig::DEFAULTS.each do |attribute, value|
    it "sets an attribute with a default value" do
      config = Twilio::Util::ClientConfig.new
      expect(config.send(attribute)).to eq(value)
    end

    it "can update the value for the attribute" do
      config = Twilio::Util::ClientConfig.new
      config.send("#{attribute}=", "blah")
      expect(config.send(attribute)).to eq("blah")
    end

    it "can set the value from a hash in the initializer" do
      config = Twilio::Util::ClientConfig.new(attribute => 'blah')
      expect(config.send(attribute)).to eq("blah")
    end
  end
end
