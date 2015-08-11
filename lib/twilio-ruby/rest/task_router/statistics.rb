module Twilio
  module REST
    module TaskRouter
      module Statistics
        def statistics(args={})
          path = "#{@path}/Statistics"
          response = @client.get(path, args)
          statistics_class.new(path, @client, response)
        end

        private

        ##
        # Gets the class for the statistics of the current class.
        # Should just be Object.const_get("#{self.class.to_s}Statistics") but
        # Ruby 1.9.3 did not agree. Can be updated if support is dropped.
        def statistics_class
          current_class = self.class.to_s.split('::').last
          statistics_class = Twilio::REST::TaskRouter.const_get(
            "#{current_class}Statistics"
          )
        end
      end
    end
  end
end
