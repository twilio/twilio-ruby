require 'spec_helper'

describe Twilio::REST::Messaging::V1::TollfreeVerificationList do
  before do
    @version = double('version')
    @tollfree_verification_list = Twilio::REST::Messaging::V1::TollfreeVerificationList.new(@version)
  end

  describe 'create' do
    it 'should serialize array parameters as comma-separated strings' do
      # Mock the version.create method to capture the data sent
      expect(@version).to receive(:create) do |method, uri, data:, headers:|
        # Verify that array parameters are serialized as comma-separated strings
        expect(data['UseCaseCategories']).to eq('ACCOUNT_NOTIFICATIONS,EVENTS')
        expect(data['OptInImageUrls']).to eq('url1,url2,url3')
        
        # Verify other parameters are unchanged
        expect(data['BusinessName']).to eq('Test Business')
        expect(data['NotificationEmail']).to eq('test@test.com')
        
        # Return a mock payload
        {
          'sid' => 'test_sid',
          'account_sid' => 'test_account_sid',
          'business_name' => 'Test Business'
        }
      end

      result = @tollfree_verification_list.create(
        business_name: 'Test Business',
        business_website: 'https://test.com',
        notification_email: 'test@test.com',
        use_case_categories: ['ACCOUNT_NOTIFICATIONS', 'EVENTS'],
        use_case_summary: 'Test summary',
        production_message_sample: 'Test message',
        opt_in_image_urls: ['url1', 'url2', 'url3'],
        opt_in_type: 'WEB_FORM',
        message_volume: '1,000',
        tollfree_phone_number_sid: 'test_phone_sid'
      )

      expect(result).to be_a(Twilio::REST::Messaging::V1::TollfreeVerificationInstance)
    end

    it 'should handle non-array parameters without modification' do
      expect(@version).to receive(:create) do |method, uri, data:, headers:|
        # Verify that non-array parameters pass through unchanged
        expect(data['UseCaseCategories']).to eq('SINGLE_CATEGORY')
        expect(data['OptInImageUrls']).to eq('single_url')
        
        # Return a mock payload
        {
          'sid' => 'test_sid',
          'account_sid' => 'test_account_sid'
        }
      end

      @tollfree_verification_list.create(
        business_name: 'Test Business',
        notification_email: 'test@test.com',
        use_case_categories: 'SINGLE_CATEGORY',
        opt_in_image_urls: 'single_url',
        tollfree_phone_number_sid: 'test_phone_sid'
      )
    end

    it 'should handle empty arrays correctly' do
      expect(@version).to receive(:create) do |method, uri, data:, headers:|
        # Verify that empty arrays become empty strings
        expect(data['UseCaseCategories']).to eq('')
        expect(data['OptInImageUrls']).to eq('')
        
        # Return a mock payload
        {
          'sid' => 'test_sid',
          'account_sid' => 'test_account_sid'
        }
      end

      @tollfree_verification_list.create(
        business_name: 'Test Business',
        notification_email: 'test@test.com',
        use_case_categories: [],
        opt_in_image_urls: [],
        tollfree_phone_number_sid: 'test_phone_sid'
      )
    end

    it 'should handle nil and :unset values correctly' do
      expect(@version).to receive(:create) do |method, uri, data:, headers:|
        # Verify that nil and :unset values pass through unchanged
        expect(data['UseCaseCategories']).to be_nil
        expect(data['OptInImageUrls']).to eq(:unset)
        
        # Return a mock payload
        {
          'sid' => 'test_sid',
          'account_sid' => 'test_account_sid'
        }
      end

      @tollfree_verification_list.create(
        business_name: 'Test Business',
        notification_email: 'test@test.com',
        use_case_categories: nil,
        opt_in_image_urls: :unset,
        tollfree_phone_number_sid: 'test_phone_sid'
      )
    end
  end
end