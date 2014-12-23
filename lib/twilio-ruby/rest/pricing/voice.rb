require 'pry'
require 'twilio-ruby/rest/pricing/countries'

module Twilio
  module REST
    module Pricing
      class Voice < InstanceResource

        def initialize(path, client, params={})
          super
          @submodule = :Pricing
          resource :countries, :phone_numbers
        end

      end
    end
  end
end
