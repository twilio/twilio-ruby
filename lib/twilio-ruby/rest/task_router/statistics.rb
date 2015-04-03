module Twilio
  module REST
    module TaskRouter
      module Statistics
        def statistics(args={})
          path = "#{@path}/Statistics"
          response = @client.get(path, args, true)
          statistic_class = Object.const_get("#{self.class.to_s}Statistics")
          statistic_class.new(path, @client, response)
        end
      end
    end
  end
end
