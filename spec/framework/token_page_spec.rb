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
        @response = instance_double('Twilio::Response', body: {
                                      'meta' => {
                                        'key' => 'records',
                                        'pageSize' => 50,
                                        'nextToken' => 'NEXT123',
                                        'previousToken' => 'PREV123'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    })

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
        expect(@token_page.url).to eq('/v1/Resource?PageToken=TOKEN123')
      end

      it 'extracts next_token from meta' do
        expect(@token_page.instance_variable_get(:@next_token)).to eq('NEXT123')
      end

      it 'extracts previous_token from meta' do
        expect(@token_page.instance_variable_get(:@previous_token)).to eq('PREV123')
      end
    end

    context 'when initialized with partial meta payload' do
      before do
        @response = instance_double('Twilio::Response', body: {
                                      'meta' => {
                                        'key' => 'records',
                                        'nextToken' => 'NEXT123'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    })

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

    context 'when initialized with no meta payload' do
      before do
        @response = instance_double('Twilio::Response', body: {
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    })

        # Mock last request not being available
        allow(@http_client).to receive(:last_request).and_return(nil)

        @token_page = Twilio::REST::TokenPage.new(@version, @response)
        @token_page.instance_variable_set(:@solution, @solution)
      end

      it 'sets the page_size to nil' do
        expect(@token_page.page_size).to be_nil
      end

      it 'sets next_token to nil' do
        expect(@token_page.instance_variable_get(:@next_token)).to be_nil
      end

      it 'sets previous_token to nil' do
        expect(@token_page.instance_variable_get(:@previous_token)).to be_nil
      end
    end
  end

  describe '#next_token' do
    context 'when meta contains nextToken' do
      before do
        @response = instance_double('Twilio::Response', body: {
                                      'meta' => {
                                        'key' => 'records',
                                        'nextToken' => 'NEXT123'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    })
        allow(@http_client).to receive(:last_request).and_return(nil)
        @token_page = Twilio::REST::TokenPage.new(@version, @response)
      end

      it 'returns the next token from meta' do
        expect(@token_page.next_token).to eq('NEXT123')
      end
    end

    context 'when meta does not contain nextToken' do
      before do
        @response = instance_double('Twilio::Response', body: {
                                      'meta' => {
                                        'key' => 'records'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    })
        allow(@http_client).to receive(:last_request).and_return(nil)
        @token_page = Twilio::REST::TokenPage.new(@version, @response)
      end

      it 'returns nil' do
        expect(@token_page.next_token).to be_nil
      end
    end

    context 'when meta is not present' do
      before do
        @response = instance_double('Twilio::Response', body: {
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    })
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
        @response = instance_double('Twilio::Response', body: {
                                      'meta' => {
                                        'key' => 'records',
                                        'previousToken' => 'PREV123'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    })
        allow(@http_client).to receive(:last_request).and_return(nil)
        @token_page = Twilio::REST::TokenPage.new(@version, @response)
      end

      it 'returns the previous token from meta' do
        expect(@token_page.previous_token).to eq('PREV123')
      end
    end

    context 'when meta does not contain previousToken' do
      before do
        @response = instance_double('Twilio::Response', body: {
                                      'meta' => {
                                        'key' => 'records'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    })
        allow(@http_client).to receive(:last_request).and_return(nil)
        @token_page = Twilio::REST::TokenPage.new(@version, @response)
      end

      it 'returns nil' do
        expect(@token_page.previous_token).to be_nil
      end
    end

    context 'when meta is not present' do
      before do
        @response = instance_double('Twilio::Response', body: {
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    })
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
        @response = instance_double('Twilio::Response', body: {
                                      'meta' => {
                                        'key' => 'records',
                                        'nextToken' => 'NEXT123'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    })

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
        @response = instance_double('Twilio::Response', body: {
                                      'meta' => {
                                        'key' => 'records'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    })
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
        @response = instance_double('Twilio::Response', body: {
                                      'meta' => {
                                        'key' => 'records',
                                        'previousToken' => 'PREV123'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    })

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
        @response = instance_double('Twilio::Response', body: {
                                      'meta' => {
                                        'key' => 'records'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    })
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
        @response = instance_double('Twilio::Response', body: {
                                      'meta' => {
                                        'key' => 'records',
                                        'nextToken' => 'NEXT123'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    })

        @next_response = instance_double('Twilio::Response', body: {
                                           'meta' => {
                                             'key' => 'records',
                                             'nextToken' => 'NEXT456'
                                           },
                                           'records' => [{ 'id' => 3 }, { 'id' => 4 }]
                                         })

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
        allow(@domain).to receive(:request).with('GET', 'https://api.twilio.com/v1/Resource?PageToken=NEXT123').and_return(@next_response)
      end

      it 'requests the next page and returns a new TokenPage instance' do
        next_page = @token_page.next_page
        expect(next_page).to be_a(Twilio::REST::TokenPage)
        expect(next_page.instance_variable_get(:@payload)).to eq(@next_response.body)
        expect(next_page.instance_variable_get(:@solution)).to eq(@solution)
      end
    end

    context 'when next_page_url is not available' do
      before do
        @response = instance_double('Twilio::Response', body: {
                                      'meta' => {
                                        'key' => 'records'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    })

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

  describe '#previous_page' do
    context 'when previous_page_url is available' do
      before do
        @response = instance_double('Twilio::Response', body: {
                                      'meta' => {
                                        'key' => 'records',
                                        'previousToken' => 'PREV123'
                                      },
                                      'records' => [{ 'id' => 3 }, { 'id' => 4 }]
                                    })

        @prev_response = instance_double('Twilio::Response', body: {
                                           'meta' => {
                                             'key' => 'records',
                                             'previousToken' => 'PREV456'
                                           },
                                           'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                         })

        # Mock the last request
        allow(@http_client).to receive(:last_request).and_return(@request)
        allow(@request).to receive(:url).and_return('https://api.twilio.com/v1/Resource')
        allow(@request).to receive(:params).and_return({ 'PageSize' => '50' })

        # Mock URI components
        allow(@uri).to receive(:path).and_return('/v1/Resource')
        allow(@uri).to receive(:query).and_return(nil)

        @token_page = Twilio::REST::TokenPage.new(@version, @response)
        @token_page.instance_variable_set(:@solution, @solution)

        # Mock previous_page_url
        allow(@token_page).to receive(:previous_page_url).and_return('https://api.twilio.com/v1/Resource?PageToken=PREV123')

        # Mock domain request for previous page
        allow(@domain).to receive(:request).with('GET', 'https://api.twilio.com/v1/Resource?PageToken=PREV123').and_return(@prev_response)
      end

      it 'requests the previous page and returns a new TokenPage instance' do
        prev_page = @token_page.previous_page
        expect(prev_page).to be_a(Twilio::REST::TokenPage)
        expect(prev_page.instance_variable_get(:@payload)).to eq(@prev_response.body)
        expect(prev_page.instance_variable_get(:@solution)).to eq(@solution)
      end
    end

    context 'when previous_page_url is not available' do
      before do
        @response = instance_double('Twilio::Response', body: {
                                      'meta' => {
                                        'key' => 'records'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    })

        allow(@http_client).to receive(:last_request).and_return(nil)
        @token_page = Twilio::REST::TokenPage.new(@version, @response)

        # Mock previous_page_url to return nil
        allow(@token_page).to receive(:previous_page_url).and_return(nil)
      end

      it 'returns nil' do
        expect(@token_page.previous_page).to be_nil
      end
    end
  end

  describe '#load_page' do
    context 'when key is present in meta' do
      before do
        @response = instance_double('Twilio::Response', body: {
                                      'meta' => {
                                        'key' => 'records'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    })

        allow(@http_client).to receive(:last_request).and_return(nil)
        @token_page = Twilio::REST::TokenPage.new(@version, @response)
      end

      it 'returns the records based on key' do
        result = @token_page.load_page(@response.body)
        expect(result).to eq([{ 'id' => 1 }, { 'id' => 2 }])
      end
    end

    context 'when key is not present in meta but set previously' do
      before do
        @response = instance_double('Twilio::Response', body: {
                                      'meta' => {},
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    })

        allow(@http_client).to receive(:last_request).and_return(nil)
        @token_page = Twilio::REST::TokenPage.new(@version, @response)
        @token_page.instance_variable_set(:@key, 'records')
      end

      it 'uses previously set key to retrieve records' do
        result = @token_page.load_page(@response.body)
        expect(result).to eq([{ 'id' => 1 }, { 'id' => 2 }])
      end
    end

    context 'when neither key is present nor records can be found' do
      before do
        @response = instance_double('Twilio::Response', body: {
                                      'meta' => {},
                                      'unknown_key' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    })

        allow(@http_client).to receive(:last_request).and_return(nil)
        @token_page = Twilio::REST::TokenPage.new(@version, @response)
      end

      it 'raises a TwilioError' do
        expect { @token_page.load_page(@response.body) }.to raise_error(Twilio::REST::TwilioError, 'Page Records can not be deserialized')
      end
    end

    context 'when key in meta is updated from a subsequent response' do
      before do
        @initial_response = instance_double('Twilio::Response', body: {
                                              'meta' => {
                                                'key' => 'records'
                                              },
                                              'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                            })

        @subsequent_response = {
          'meta' => {
            'key' => 'messages'
          },
          'messages' => [{ 'id' => 3 }, { 'id' => 4 }]
        }

        allow(@http_client).to receive(:last_request).and_return(nil)
        @token_page = Twilio::REST::TokenPage.new(@version, @initial_response)
      end

      it 'updates the key and returns the new records' do
        result = @token_page.load_page(@subsequent_response)
        expect(@token_page.instance_variable_get(:@key)).to eq('messages')
        expect(result).to eq([{ 'id' => 3 }, { 'id' => 4 }])
      end
    end
  end

  describe 'edge cases and error handling' do
    context 'when response status is not 200' do
      before do
        @error_response = instance_double('Twilio::Response')
        allow(@error_response).to receive(:status_code).and_return(400)
        allow(@error_response).to receive(:body).and_return({ 'message' => 'Bad Request' })
      end

      it 'raises a RestError during initialization' do
        expect { Twilio::REST::TokenPage.new(@version, @error_response) }.to raise_error(Twilio::REST::RestError)
      end
    end

    context 'when URL contains sensitive information' do
      before do
        @response = instance_double('Twilio::Response', body: {
                                      'meta' => {
                                        'key' => 'records'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    })

        # Mock the last request with sensitive information
        @sensitive_url = 'https://api.twilio.com/v1/Resource?AuthToken=abc123&PageToken=TOKEN123'
        allow(@http_client).to receive(:last_request).and_return(@request)
        allow(@request).to receive(:url).and_return(@sensitive_url)
        allow(@request).to receive(:params).and_return({ 'PageSize' => '50', 'AuthToken' => 'abc123' })

        # Mock URI parsing
        sensitive_uri = instance_double('URI::HTTPS')
        allow(URI).to receive(:parse).with(@sensitive_url).and_return(sensitive_uri)
        allow(sensitive_uri).to receive(:path).and_return('/v1/Resource')
        allow(sensitive_uri).to receive(:query).and_return('AuthToken=abc123&PageToken=TOKEN123')

        @token_page = Twilio::REST::TokenPage.new(@version, @response)
      end

      it 'preserves URL query parameters including sensitive ones' do
        expect(@token_page.url).to eq('/v1/Resource?AuthToken=abc123&PageToken=TOKEN123')
      end
    end

    context 'when initialized with malformed response' do
      before do
        @response = instance_double('Twilio::Response', body: nil)
        allow(@response).to receive(:status_code).and_return(200)
      end

      it 'raises an error when accessing payload' do
        token_page = Twilio::REST::TokenPage.new(@version, @response)
        expect { token_page.load_page(nil) }.to raise_error(Twilio::REST::TwilioError)
      end
    end

    context 'when handling Unicode characters in tokens' do
      before do
        @response = instance_double('Twilio::Response', body: {
                                      'meta' => {
                                        'key' => 'records',
                                        'nextToken' => 'NEXT123=世界'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    })

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

      it 'preserves Unicode characters in tokens' do
        expect(@token_page.next_token).to eq('NEXT123=世界')
        @token_page.next_page_url
        expect(@token_page.instance_variable_get(:@params)).to include('pageToken' => 'NEXT123=世界')
      end
    end

    context 'when params are not present in last request' do
      before do
        @response = instance_double('Twilio::Response', body: {
                                      'meta' => {
                                        'key' => 'records',
                                        'nextToken' => 'NEXT123'
                                      },
                                      'records' => [{ 'id' => 1 }, { 'id' => 2 }]
                                    })

        # Mock the last request without params
        allow(@http_client).to receive(:last_request).and_return(@request)
        allow(@request).to receive(:url).and_return('https://api.twilio.com/v1/Resource')
        allow(@request).to receive(:params).and_return(nil)

        # Mock URI components
        allow(@uri).to receive(:path).and_return('/v1/Resource')
        allow(@uri).to receive(:query).and_return(nil)

        @token_page = Twilio::REST::TokenPage.new(@version, @response)

        # Mock domain absolute_url
        allow(@domain).to receive(:absolute_url).with('/v1/Resource').and_return('https://api.twilio.com/v1/Resource')
      end

      it 'initializes params when not present' do
        expect(@token_page.instance_variable_get(:@params)).to be_nil
        @token_page.next_page_url
        expect(@token_page.instance_variable_get(:@params)).to eq('pageToken' => 'NEXT123')
      end
    end
  end
end
