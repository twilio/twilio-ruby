module Twilio
  module REST
    class Records < ListResource
      def initialize(path, client)
        super
        @submodule = :Records
        @instance_class = Twilio::REST::Record
        @list_key = 'usage_records'
        resources :daily,
                  :monthly,
                  :yearly,
                  :all_time,
                  :today,
                  :yesterday,
                  :this_month,
                  :last_month
      end
    end

    class Record < InstanceResource; end
  end
end
