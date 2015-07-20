module Twilio
  module REST
    module Pricing
      class Countries < NextGenListResource
        def initialize(path, client)
          super
          @list_key = 'countries'
          @instance_id_key = 'iso_country'
          @submodule = :Pricing
        end
      end

      class Country < InstanceResource
        def initialize(path, client, params={})
          super
          @submodule = :Pricing
        end
      end
    end
  end
end
