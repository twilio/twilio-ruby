module Twilio
  module REST
    module Trunking
      class Trunks < NextGenListResource; end
      class Trunk < InstanceResource

        def initialize(path, client, params={})
          super
          @submodule = :Trunking
          resource :credential_lists,
                   :ip_access_control_lists,
                   :origination_urls,
                   :phone_numbers
        end

      end
    end
  end
end
