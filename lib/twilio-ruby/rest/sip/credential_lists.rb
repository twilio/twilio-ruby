module Twilio
  module REST
    class CredentialLists < ListResource; end
    class CredentialList < InstanceResource
      def initialize(path, client, params={})
        super
        resource :credentials
      end
    end
  end
end
