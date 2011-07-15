module Twilio
  module REST
    class Calls < ListResource
      def make(from, to, url)
        create :from => from, :to => to, :url => url
      end
    end
  end
end

