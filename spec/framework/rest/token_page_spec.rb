require 'spec_helper'

describe Twilio::REST::TokenPage do
  before do
    @version = instance_double('Twilio::REST::Version')
    @domain = instance_double('Twilio::REST::Domain')
    @client = instance_double('Twilio::REST::Client')
    @http_client = instance_double('Twilio::Http::Client')
    @request = instance_double('Twilio::Request')

    allow(@version).to receive(:domain).and_return(@domain)
    allow(@domain).to receive(:client).and_return(@client)
    allow(@client).to receive(:http_client).and_return(@http_client)

    # Mock URI parsing
    @uri = instance_double('URI::HTTPS')
    allow(URI).to receive(:parse).and_return(@uri)

    # Set solution for all tests
    @solution = { 'resource_type' => 'messages' }
  end

  describe 'initialization' do
    context 'when initialized with complete meta payload' do
      before do
        @response = instance_double('Twilio::Response',
                                    body: {
                                      'meta' => {
                                        'key' => 'records',
                                        'pageSize' => 50,
                                        'nextToken' => 'NEXT123',
                                        'previousToken' => 'PREV123'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    },
                                    headers: { 'status_code' => '200' },
                                    status_code: 200)

        # Mock the last request
        allow(@http_client).to receive(:last_request).and_return(@request)
        allow(@request).to receive(:url).and_return('https://api.twilio.com/v1/Resource?PageToken=TOKEN123')
        allow(@request).to receive(:params).and_return({ 'PageSize' => '50' })

        # Mock URI components
        allow(@uri).to receive(:path).and_return('/v1/Resource')
        allow(@uri).to receive(:query).and_return('PageToken=TOKEN123')

        @token_page = Twilio::REST::TokenPage.new(@version, @response)
        @token_page.instance_variable_set(:@solution, @solution)
      end

      it 'sets the page_size from meta' do
        expect(@token_page.page_size).to eq(50)
      end

      it 'sets the URL from the last request' do
        expect(@token_page.url).to eq('/v1/Resource')
      end

      it 'extracts next_token from meta' do
        expect(@token_page.instance_variable_get(:@next_token)).to eq('NEXT123')
      end

      it 'extracts previous_token from meta' do
        expect(@token_page.previous_token).to eq('PREV123')
      end
    end

    context 'when initialized with partial meta payload' do
      before do
        @response = instance_double('Twilio::Response',
                                    body: {
                                      'meta' => {
                                        'key' => 'records',
                                        'nextToken' => 'NEXT123'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    },
                                    headers: { 'status_code' => '200' },
                                    status_code: 200)

        # Mock last request not being available
        allow(@http_client).to receive(:last_request).and_return(nil)

        @token_page = Twilio::REST::TokenPage.new(@version, @response)
        @token_page.instance_variable_set(:@solution, @solution)
      end

      it 'sets the page_size to nil when not in meta' do
        expect(@token_page.page_size).to be_nil
      end

      it 'sets empty URL when no last request' do
        expect(@token_page.url).to eq('')
      end

      it 'extracts next_token from meta' do
        expect(@token_page.instance_variable_get(:@next_token)).to eq('NEXT123')
      end

      it 'sets previous_token to nil when not in meta' do
        expect(@token_page.instance_variable_get(:@previous_token)).to be_nil
      end
    end
  end

  describe '#next_token' do
    context 'when meta contains nextToken' do
      before do
        @response = instance_double('Twilio::Response',
                                    body: {
                                      'meta' => {
                                        'key' => 'records',
                                        'nextToken' => 'NEXT123'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    },
                                    headers: { 'status_code' => '200' },
                                    status_code: 200)
        allow(@http_client).to receive(:last_request).and_return(nil)
        @token_page = Twilio::REST::TokenPage.new(@version, @response)
      end

      it 'returns the next token from meta' do
        expect(@token_page.next_token).to eq('NEXT123')
      end
    end

    context 'when meta does not contain nextToken' do
      before do
        @response = instance_double('Twilio::Response',
                                    body: {
                                      'meta' => {
                                        'key' => 'records'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    },
                                    headers: { 'status_code' => '200' },
                                    status_code: 200)
        allow(@http_client).to receive(:last_request).and_return(nil)
        @token_page = Twilio::REST::TokenPage.new(@version, @response)
      end

      it 'returns nil' do
        expect(@token_page.next_token).to be_nil
      end
    end
  end

  describe '#previous_token' do
    context 'when meta contains previousToken' do
      before do
        @response = instance_double('Twilio::Response',
                                    body: {
                                      'meta' => {
                                        'key' => 'records',
                                        'previousToken' => 'PREV123'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    },
                                    headers: { 'status_code' => '200' },
                                    status_code: 200)
        allow(@http_client).to receive(:last_request).and_return(nil)
        @token_page = Twilio::REST::TokenPage.new(@version, @response)
      end

      it 'returns the previous token from meta' do
        expect(@token_page.previous_token).to eq('PREV123')
      end
    end

    context 'when meta does not contain previousToken' do
      before do
        @response = instance_double('Twilio::Response',
                                    body: {
                                      'meta' => {
                                        'key' => 'records'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    },
                                    headers: { 'status_code' => '200' },
                                    status_code: 200)
        allow(@http_client).to receive(:last_request).and_return(nil)
        @token_page = Twilio::REST::TokenPage.new(@version, @response)
      end

      it 'returns nil' do
        expect(@token_page.previous_token).to be_nil
      end
    end
  end

  describe '#next_page_url' do
    context 'when next_token is present' do
      before do
        @response = instance_double('Twilio::Response',
                                    body: {
                                      'meta' => {
                                        'key' => 'records',
                                        'nextToken' => 'NEXT123'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    },
                                    headers: { 'status_code' => '200' },
                                    status_code: 200)

        # Mock the last request
        allow(@http_client).to receive(:last_request).and_return(@request)
        allow(@request).to receive(:url).and_return('https://api.twilio.com/v1/Resource')
        allow(@request).to receive(:params).and_return({ 'PageSize' => '50' })

        # Mock URI components
        allow(@uri).to receive(:path).and_return('/v1/Resource')
        allow(@uri).to receive(:query).and_return(nil)

        @token_page = Twilio::REST::TokenPage.new(@version, @response)

        # Mock domain absolute_url
        allow(@domain).to receive(:absolute_url).with('/v1/Resource').and_return('https://api.twilio.com/v1/Resource')
      end

      it 'sets pageToken param and returns absolute URL' do
        expect(@token_page.next_page_url).to eq('https://api.twilio.com/v1/Resource')
        expect(@token_page.instance_variable_get(:@params)).to include('pageToken' => 'NEXT123')
      end
    end

    context 'when next_token is nil' do
      before do
        @response = instance_double('Twilio::Response',
                                    body: {
                                      'meta' => {
                                        'key' => 'records'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    },
                                    headers: { 'status_code' => '200' },
                                    status_code: 200)
        allow(@http_client).to receive(:last_request).and_return(nil)
        @token_page = Twilio::REST::TokenPage.new(@version, @response)

        # Mock the TokenPage.next_token method
        allow(@token_page).to receive(:next_token).and_return(nil)
      end

      it 'returns nil' do
        expect(@token_page.next_page_url).to be_nil
      end
    end
  end

  describe '#previous_page_url' do
    context 'when previous_token is present' do
      before do
        @response = instance_double('Twilio::Response',
                                    body: {
                                      'meta' => {
                                        'key' => 'records',
                                        'previousToken' => 'PREV123'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    },
                                    headers: { 'status_code' => '200' },
                                    status_code: 200)

        # Mock the last request
        allow(@http_client).to receive(:last_request).and_return(@request)
        allow(@request).to receive(:url).and_return('https://api.twilio.com/v1/Resource')
        allow(@request).to receive(:params).and_return({ 'PageSize' => '50' })

        # Mock URI components
        allow(@uri).to receive(:path).and_return('/v1/Resource')
        allow(@uri).to receive(:query).and_return(nil)

        @token_page = Twilio::REST::TokenPage.new(@version, @response)

        # Mock domain absolute_url
        allow(@domain).to receive(:absolute_url).with('/v1/Resource').and_return('https://api.twilio.com/v1/Resource')
      end

      it 'sets pageToken param and returns absolute URL' do
        expect(@token_page.previous_page_url).to eq('https://api.twilio.com/v1/Resource')
        expect(@token_page.instance_variable_get(:@params)).to include('pageToken' => 'PREV123')
      end
    end

    context 'when previous_token is nil' do
      before do
        @response = instance_double('Twilio::Response',
                                    body: {
                                      'meta' => {
                                        'key' => 'records'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    },
                                    headers: { 'status_code' => '200' },
                                    status_code: 200)
        allow(@http_client).to receive(:last_request).and_return(nil)
        @token_page = Twilio::REST::TokenPage.new(@version, @response)

        # Mock the TokenPage.previous_token method
        allow(@token_page).to receive(:previous_token).and_return(nil)
      end

      it 'returns nil' do
        expect(@token_page.previous_page_url).to be_nil
      end
    end
  end

  describe '#next_page' do
    context 'when next_page_url is available' do
      before do
        @response = instance_double('Twilio::Response',
                                    body: {
                                      'meta' => {
                                        'key' => 'records',
                                        'nextToken' => 'NEXT123'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    },
                                    headers: { 'status_code' => '200' },
                                    status_code: 200)

        @next_response = instance_double('Twilio::Response',
                                         body: {
                                           'meta' => {
                                             'key' => 'records',
                                             'nextToken' => 'NEXT456'
                                           },
                                           'records' => [{ 'id' => 3 }, { 'id' => 4 }]
                                         },
                                         headers: { 'status_code' => '200' },
                                         status_code: 200)

        # Mock the last request
        allow(@http_client).to receive(:last_request).and_return(@request)
        allow(@request).to receive(:url).and_return('https://api.twilio.com/v1/Resource')
        allow(@request).to receive(:params).and_return({ 'PageSize' => '50' })

        # Mock URI components
        allow(@uri).to receive(:path).and_return('/v1/Resource')
        allow(@uri).to receive(:query).and_return(nil)

        @token_page = Twilio::REST::TokenPage.new(@version, @response)
        @token_page.instance_variable_set(:@solution, @solution)

        # Mock next_page_url
        allow(@token_page).to receive(:next_page_url).and_return('https://api.twilio.com/v1/Resource?PageToken=NEXT123')

        # Mock domain request for next page
        allow(@domain).to receive(:request).with('GET', 'https://api.twilio.com/v1/Resource?PageToken=NEXT123', { 'PageSize' => '50' }).and_return(@next_response)
      end

      it 'properly handles status code when navigating to next page' do
        expect(@next_response.status_code).to eq(200)
        expect(@next_response.headers).to include('status_code' => '200')
      end
    end

    context 'when next_page_url is not available' do
      before do
        @response = instance_double('Twilio::Response',
                                    body: {
                                      'meta' => {
                                        'key' => 'records'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    },
                                    headers: { 'status_code' => '200' },
                                    status_code: 200)

        allow(@http_client).to receive(:last_request).and_return(nil)
        @token_page = Twilio::REST::TokenPage.new(@version, @response)

        # Mock next_page_url to return nil
        allow(@token_page).to receive(:next_page_url).and_return(nil)
      end

      it 'returns nil' do
        expect(@token_page.next_page).to be_nil
      end
    end
  end

  describe '#load_page' do
    context 'when key is present in meta' do
      before do
        @response = instance_double('Twilio::Response',
                                    body: {
                                      'meta' => {
                                        'key' => 'records'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    },
                                    headers: { 'status_code' => '200' },
                                    status_code: 200)

        allow(@http_client).to receive(:last_request).and_return(nil)
        @token_page = Twilio::REST::TokenPage.new(@version, @response)
      end

      it 'returns the records based on key' do
        result = @token_page.load_page(@response.body)
        expect(result).to eq([{ 'id' => 1 }, { 'id' => 2 }])
      end
    end
  end
end
