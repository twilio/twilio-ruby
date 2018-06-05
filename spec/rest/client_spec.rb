require 'spec_helper'

describe Twilio::REST::ObsoleteClient do
  it 'raise an exception' do
    expect { Twilio::REST::ObsoleteClient.new }.to raise_error(Twilio::REST::ObsoleteError)
  end
end

describe Twilio::REST::BaseClient do
  it 'raise an exception' do
    expect { Twilio::REST::BaseClient.new }.to raise_error(Twilio::REST::ObsoleteError)
  end
end

describe Twilio::REST::IpMessagingClient do
  it 'raise an exception' do
    expect { Twilio::REST::IpMessagingClient.new }.to raise_error(Twilio::REST::ObsoleteError)
  end
end

describe Twilio::REST::LookupsClient do
  it 'raise an exception' do
    expect { Twilio::REST::LookupsClient.new }.to raise_error(Twilio::REST::ObsoleteError)
  end
end

describe Twilio::REST::MonitorClient do
  it 'raise an exception' do
    expect { Twilio::REST::MonitorClient.new }.to raise_error(Twilio::REST::ObsoleteError)
  end
end

describe Twilio::REST::PricingClient do
  it 'raise an exception' do
    expect { Twilio::REST::PricingClient.new }.to raise_error(Twilio::REST::ObsoleteError)
  end
end

describe Twilio::REST::TaskRouterClient do
  it 'raise an exception' do
    expect { Twilio::REST::TaskRouterClient.new }.to raise_error(Twilio::REST::ObsoleteError)
  end
end

describe Twilio::REST::TrunkingClient do
  it 'raise an exception' do
    expect { Twilio::REST::TrunkingClient.new }.to raise_error(Twilio::REST::ObsoleteError)
  end
end

describe Twilio::REST::Client do
  it 'successfully validates the working SSL certificate' do
    @holodeck.mock Twilio::Response.new(200, '')
    expect { @client.validate_ssl_certificate }.not_to raise_error
  end

  it 'fails to validate broken SSL certificates' do
    @holodeck.mock Twilio::Response.new(504, '')
    expect { @client.validate_ssl_certificate }.to raise_error(Twilio::REST::RestError)
  end
end
