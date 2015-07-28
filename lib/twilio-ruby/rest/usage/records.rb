module Twilio
  module REST
    class RecordList < ListResource
      def initialize(path, client)
        super
        @submodule = :Records
        @instance_class = Twilio::REST::Record
        @list_key = 'usage_records'
        resource :all_time,
                 :daily,
                 :last_month,
                 :monthly,
                 :this_month,
                 :today,
                 :yearly,
                 :yesterday
      end
    end

    class Record < InstanceResource; end
  end
end
