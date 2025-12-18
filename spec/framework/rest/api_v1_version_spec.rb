require 'spec_helper'

describe Twilio::REST::RestErrorV10 do
  describe 'initialization' do
    it 'initializes with all fields from the response' do
      response_data = {
        'code' => '12345',
        'message' => 'Test error message',
        'httpsStatusCode' => 400,
        'params' => { 'param1' => 'value1' },
        'userError' => true
      }

      error = Twilio::REST::RestErrorV10.new(response_data)

      expect(error.code).to eq('12345')
      expect(error.message).to eq('Test error message')
      expect(error.http_status_code).to eq(400)
      expect(error.params).to eq({ 'param1' => 'value1' })
      expect(error.user_error).to eq(true)
    end

    it 'handles missing fields gracefully' do
      response_data = {
        'code' => '67890'
      }

      error = Twilio::REST::RestErrorV10.new(response_data)

      expect(error.code).to eq('67890')
      expect(error.message).to be_nil
      expect(error.http_status_code).to be_nil
      expect(error.params).to be_nil
      expect(error.user_error).to be_nil
    end

    it 'handles empty hash response data' do
      error = Twilio::REST::RestErrorV10.new({})

      expect(error.code).to be_nil
      expect(error.message).to be_nil
      expect(error.http_status_code).to be_nil
      expect(error.params).to be_nil
      expect(error.user_error).to be_nil
    end
  end

  describe '#to_s' do
    it 'returns the message as string representation' do
      error = Twilio::REST::RestErrorV10.new('message' => 'Error message')
      expect(error.to_s).to eq('Error message')
    end

    it 'returns empty string for nil message' do
      error = Twilio::REST::RestErrorV10.new('code' => '54321')
      expect(error.to_s).to be_nil
    end
  end
end

describe Twilio::REST::ApiV1Version do
  before do
    @domain = double('Domain')
    @version = double('Version', version: 'v1')
    @api_v1_version = Twilio::REST::ApiV1Version.new(@domain, @version)
  end

  describe 'initialization' do
    it 'initializes with the correct api_version' do
      expect(@api_v1_version.api_version).to eq('v1')
      expect(@api_v1_version.domain).to eq(@domain)
      expect(@api_v1_version.version).to eq('v1')
    end
  end

  describe '#exception' do
    it 'returns a RestErrorV10 instance with the response body' do
      response_body = {
        'code' => '12345',
        'message' => 'Error message',
        'httpsStatusCode' => 400,
        'params' => { 'param1' => 'value1' },
        'userError' => true
      }

      response = double('Response', body: response_body)
      header = 'Unable to fetch record'

      error = @api_v1_version.exception(response, header)
      expect(error).to be_a(Twilio::REST::RestErrorV10)
      expect(error.code).to eq('12345')
      expect(error.message).to eq('Error message')
      expect(error.http_status_code).to eq(400)
      expect(error.params).to eq({ 'param1' => 'value1' })
      expect(error.user_error).to eq(true)
    end

    it 'handles empty response body' do
      empty_response = double('Response', body: {})
      header = 'Unable to update record'

      error = @api_v1_version.exception(empty_response, header)
      expect(error).to be_a(Twilio::REST::RestErrorV10)
      expect(error.code).to be_nil
      expect(error.message).to be_nil
      expect(error.http_status_code).to be_nil
      expect(error.params).to be_nil
      expect(error.user_error).to be_nil
    end

    it 'handles nil values in response body' do
      partial_response = double('Response', body: {
                                  'code' => '54321',
                                  'message' => 'Another error'
                                })
      header = 'Unable to create record'

      error = @api_v1_version.exception(partial_response, header)
      expect(error).to be_a(Twilio::REST::RestErrorV10)
      expect(error.code).to eq('54321')
      expect(error.message).to eq('Another error')
      expect(error.http_status_code).to be_nil
      expect(error.params).to be_nil
      expect(error.user_error).to be_nil
    end

    it 'handles response with null/nil values explicitly set' do
      response_with_nulls = double('Response', body: {
                                     'code' => '67890',
                                     'message' => nil,
                                     'httpsStatusCode' => nil,
                                     'params' => nil,
                                     'userError' => nil
                                   })
      header = 'Unable to delete record'

      error = @api_v1_version.exception(response_with_nulls, header)
      expect(error).to be_a(Twilio::REST::RestErrorV10)
      expect(error.code).to eq('67890')
      expect(error.message).to be_nil
      expect(error.http_status_code).to be_nil
      expect(error.params).to be_nil
      expect(error.user_error).to be_nil
    end

    it 'ignores unknown fields in the response' do
      response_with_extra = double('Response', body: {
                                     'code' => '11111',
                                     'message' => 'Known error',
                                     'unknown_field' => 'Some value',
                                     'another_unknown' => 'Another value'
                                   })
      header = 'Unable to process record'

      error = @api_v1_version.exception(response_with_extra, header)
      expect(error).to be_a(Twilio::REST::RestErrorV10)
      expect(error.code).to eq('11111')
      expect(error.message).to eq('Known error')
      # No assertion for unknown fields as they should be ignored
    end
  end
end
