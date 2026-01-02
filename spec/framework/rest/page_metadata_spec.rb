require 'spec_helper'

describe Twilio::REST::PageMetadata do
  before do
    @version = instance_double('Twilio::REST::Version')
    @domain = instance_double('Twilio::REST::Domain')
    @client = instance_double('Twilio::REST::Client')

    allow(@version).to receive(:domain).and_return(@domain)
  end

  describe '#process_response' do
    it 'returns response when status code is 200' do
      response = instance_double('Twilio::Response', { status_code: 200, body: { 'key' => 'value' } })
      page_metadata = Twilio::REST::PageMetadata.new(@version, response)
      expect(page_metadata.instance_variable_get(:@payload)).to eq(response)
    end

    it 'raises RestError when status code is not 200' do
      response = instance_double('Twilio::Response', { status_code: 404, body: { 'key' => 'value' } })
      expect {
        Twilio::REST::PageMetadata.new(@version, response)
      }.to raise_error(Twilio::REST::RestError)
    end
  end

  describe '#get_key' do
    let(:page_metadata) { Twilio::REST::PageMetadata.new(@version, instance_double('Twilio::Response', status_code: 200)) }

    it 'returns "Resources" when payload has Resources key' do
      payload = { 'Resources' => [], 'other_key' => 'value' }
      expect(page_metadata.get_key(payload)).to eq('Resources')
    end

    it 'returns key from meta.key when available' do
      payload = { 'meta' => { 'key' => 'accounts' }, 'other_key' => 'value' }
      expect(page_metadata.get_key(payload)).to eq('accounts')
    end

    it 'returns the non-meta key when there is only one' do
      payload = { 'accounts' => [], 'page' => 1, 'page_size' => 50, 'uri' => '/uri' }
      expect(page_metadata.get_key(payload)).to eq('accounts')
    end

    it 'raises TwilioError when key cannot be determined' do
      payload = { 'key1' => [], 'key2' => [], 'page' => 1 }
      expect {
        page_metadata.get_key(payload)
      }.to raise_error(Twilio::REST::TwilioError, 'Page Records can not be deserialized')
    end
  end

  describe '#previous_page_url' do
    before do
      allow(@domain).to receive(:absolute_url).and_return('https://api.twilio.com/v1/resource')
    end

    it 'returns nil when no previous page information is available' do
      response = double('Twilio::Response', status_code: 200)
      allow(response).to receive(:[]).with('meta').and_return(nil)
      allow(response).to receive(:[]).with('previous_page_uri').and_return(nil)
      page_metadata = Twilio::REST::PageMetadata.new(@version, response)
      expect(page_metadata.previous_page_url).to be_nil
    end

    it 'uses meta.previous_page_url when available' do
      response = double('Twilio::Response', status_code: 200)
      allow(response).to receive(:[]).with('meta').and_return({ 'previous_page_url' => '/v1/resource?page=1' })

      uri_double = double('URI::Generic', request_uri: '/v1/resource?page=1')
      allow(URI).to receive(:parse).with('/v1/resource?page=1').and_return(uri_double)

      page_metadata = Twilio::REST::PageMetadata.new(@version, response)
      expect(@domain).to receive(:absolute_url).with('/v1/resource?page=1')
      page_metadata.previous_page_url
    end

    it 'uses previous_page_uri when meta.previous_page_url is not available' do
      response = double('Twilio::Response', status_code: 200)
      allow(response).to receive(:[]).with('meta').and_return(nil)
      allow(response).to receive(:[]).with('previous_page_uri').and_return('/v1/resource?page=1')
      page_metadata = Twilio::REST::PageMetadata.new(@version, response)
      expect(@domain).to receive(:absolute_url).with('/v1/resource?page=1')
      page_metadata.previous_page_url
    end
  end

  describe '#next_page_url' do
    before do
      allow(@domain).to receive(:absolute_url).and_return('https://api.twilio.com/v1/resource')
    end

    it 'returns nil when no next page information is available' do
      response = instance_double('Twilio::Response', status_code: 200, body: {})
      page_metadata = Twilio::REST::PageMetadata.new(@version, response)
      expect(page_metadata.next_page_url).to be_nil
    end

    it 'uses next_page_uri when meta.next_page_url is not available' do
      response = instance_double('Twilio::Response', status_code: 200)
      response_body = { 'next_page_uri' => '/v1/resource?page=2' }
      allow(response).to receive(:body).and_return(response_body)

      page_metadata = Twilio::REST::PageMetadata.new(@version, response)
      expect(@domain).to receive(:absolute_url).with('/v1/resource?page=2')
      page_metadata.next_page_url
    end
  end

  describe '#previous_page' do
    it 'returns nil when previous_page_url is nil' do
      response = instance_double('Twilio::Response', status_code: 200)
      page_metadata = Twilio::REST::PageMetadata.new(@version, response)

      allow(page_metadata).to receive(:previous_page_url).and_return(nil)
      expect(page_metadata.previous_page).to be_nil
    end

    it 'makes a GET request to the previous_page_url when available' do
      response = instance_double('Twilio::Response', status_code: 200)
      page_metadata = Twilio::REST::PageMetadata.new(@version, response)

      allow(page_metadata).to receive(:previous_page_url).and_return('https://api.twilio.com/v1/resource?page=1')
      expect(@domain).to receive(:request).with('GET', 'https://api.twilio.com/v1/resource?page=1')

      page_metadata.previous_page
    end
  end

  describe '#next_page' do
    it 'returns nil when next_page_url is nil' do
      response = instance_double('Twilio::Response', status_code: 200)
      page_metadata = Twilio::REST::PageMetadata.new(@version, response)

      allow(page_metadata).to receive(:next_page_url).and_return(nil)
      expect(page_metadata.next_page).to be_nil
    end

    it 'makes a GET request to the next_page_url when available' do
      response = instance_double('Twilio::Response', status_code: 200)
      page_metadata = Twilio::REST::PageMetadata.new(@version, response)

      allow(page_metadata).to receive(:next_page_url).and_return('https://api.twilio.com/v1/resource?page=2')
      expect(@domain).to receive(:request).with('GET', 'https://api.twilio.com/v1/resource?page=2')

      page_metadata.next_page
    end
  end

  describe '#to_s' do
    it 'returns the string representation' do
      response = instance_double('Twilio::Response', status_code: 200)
      page_metadata = Twilio::REST::PageMetadata.new(@version, response)

      expect(page_metadata.to_s).to eq('#<PageMetadata>')
    end
  end
end
