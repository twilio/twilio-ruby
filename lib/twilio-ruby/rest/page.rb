module Twilio
  module REST
    class Page
      def initialize(domain, pager, instance, instance_kwargs, previous_page_uri, next_page_uri, records)
        @domain = domain
        @pager = pager
        @instance = instance
        @instance_kwargs = instance_kwargs
        @previous_page_uri = previous_page_uri
        @next_page_uri = next_page_uri
        @records = records
      end

      # TODO: Figure out how to do these
      # def __iter__(self):
      #     return self
      #
      # def __next__(self):
      #     return self.next()
      #
      # def next(self):
      #     return self._instance(self._domain, next(self._records), **self._instance_kwargs)

      # TODO: Figure out how to do this
      def next_page()
        return nil unless @next_page_uri
        kwargs = urlparse.parse_qs(urlparse.urlparse(self._next_page_uri).query)
        @pager.page(kwargs)
      end

      # TODO: Figure out how to do this
      def previous_page()
        return nil unless @previous_page_uri
        kwargs = urlparse.parse_qs(urlparse.urlparse(self._previous_page_uri).query)
        @pager.page(**kwargs)
      end

      def to_s()
        "#<Page #{@instance}>"
      end
    end
  end
end




