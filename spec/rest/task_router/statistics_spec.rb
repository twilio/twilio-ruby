require 'spec_helper'

class Twilio::REST::TaskRouter::StatisticsTestHarnessStatistics
  def initialize(*args)
  end
end

class StatisticsTestHarness
  include Twilio::REST::TaskRouter::Statistics

  def initialize(path, client)
    @path = path
    @client = client
  end
end

describe Twilio::REST::TaskRouter::Statistics do
  it "creates a new statistics object based on the class" do
    client = double("Client")
    allow(client).to receive(:get)
    harness = StatisticsTestHarness.new("/test/harness", client)
    expect(harness.statistics).to(
      be_an_instance_of(Twilio::REST::TaskRouter::StatisticsTestHarnessStatistics)
    )
  end

  it "passes parameters to the HTTP request for statistics" do
    client = Twilio::REST::Client.new 'someSid', 'someAuthToken'
    allow(Net::HTTP::Get).to receive(:new)
      .with("/test/harness/Statistics.json?Minutes=15", Twilio::REST::BaseClient::HTTP_HEADERS)
      .and_call_original
    harness = StatisticsTestHarness.new("/test/harness", client)
    expect(harness.statistics(minutes: 15)).to(
      be_an_instance_of(Twilio::REST::TaskRouter::StatisticsTestHarnessStatistics)
    )
  end
end
