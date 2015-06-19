module Twilio
  module REST
    module Lookups
      class PhoneNumbers < Twilio::REST::NextGenListResource;
        include Twilio::Util
        include Twilio::REST::Utils

        def get(number, query={})
          full_path = "#{@path}/#{URI.encode(number)}"
          full_path << "?#{url_encode(twilify(query))}" if !query.empty?
          @instance_class.new full_path, @client
        end
      end
      class PhoneNumber < InstanceResource; end
    end
  end
end
