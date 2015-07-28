module Twilio
  module REST
    class IncomingPhoneNumbers < ListResource
      can :list, :get, :create

      def initialize(path, client)
        super
        path "/Accounts/#{@account_sid}/IncomingPhoneNumbers.json"
        components :local,
                   :mobile,
                   :toll_free
      end

      def buy(phone_number)
        create phone_number: phone_number
      end
    end

    class IncomingPhoneNumber < InstanceResource
      can :update, :delete
      # Not sure about this yet
      attributes :account_sid, :address_requirements, :api_version, :beta,
                 :capabilities, :date_created, :date_updated, :friendly_name,
                 :phone_number, :sms_application_sid, :sms_fallback_url,
                 :sms_url, :status_callback, :status_callback,
                 :status_callback_method, :uri, :voice_application_sid,
                 :voice_caller_id_lookup, :voice_fallback_method,
                 :voice_fallback_url, :voice_method, :voice_url

      def initialize(path, client, params={})
        path "/Accounts/#{@account_sid}/IncomingPhoneNumbers/#{@sid}"
      end
    end
  end
end
