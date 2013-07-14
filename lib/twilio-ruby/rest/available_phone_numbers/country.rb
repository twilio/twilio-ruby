module Twilio
  module REST
    class Country < InstanceResource
      def initialize(path, client, params={})
        super path, client, params
        resource :local, :toll_free
      end
    end
  end
end
