module Twilio
  module REST
    class Records < ListResource

      SUBRESOURCES = [:daily, :monthly, :yearly, :all_time, :today,
                      :yesterday, :this_month, :last_month]

      def initialize(path, client)
        super
        @list_key = 'usage_records'
      end

      def method_missing(method, *args)
        return super unless SUBRESOURCES.include? method
        self.class.new "#{@path}/#{twilify(method)}", @client
      end
    end

    class Record < InstanceResource; end
  end
end
