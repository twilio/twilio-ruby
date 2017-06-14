##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class UsageList < ListResource
            class RecordList < ListResource
              class ThisMonthList < ListResource
                ##
                # Initialize the ThisMonthList
                # @param [Version] version Version that contains the resource
                # @param [String] account_sid A 34 character string that uniquely identifies this
                #   resource.
                # @return [ThisMonthList] ThisMonthList
                def initialize(version, account_sid: nil)
                  super(version)

                  # Path Solution
                  @solution = {
                      account_sid: account_sid
                  }
                  @uri = "/Accounts/#{@solution[:account_sid]}/Usage/Records/ThisMonth.json"
                end

                ##
                # Lists ThisMonthInstance records from the API as a list.
                # Unlike stream(), this operation is eager and will load `limit` records into
                # memory before returning.
                # @param [this_month.Category] category The category
                # @param [Date] start_date The start_date
                # @param [Date] end_date The end_date
                # @param [Integer] limit Upper limit for the number of records to return. stream()
                #                   guarantees to never return more than limit.  Default is no limit
                # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
                #  the default value of 50 records.  If no page_size is                      defined
                #  but a limit is defined, stream() will attempt to read                      the
                #  limit with the most efficient page size,                      i.e. min(limit, 1000)
                # @return [Array] Array of up to limit results
                def list(category: Twilio::Values::Unset, start_date: Twilio::Values::Unset, end_date: Twilio::Values::Unset, limit: nil, page_size: nil)
                  self.stream(
                      category: category,
                      start_date: start_date,
                      end_date: end_date,
                      limit: limit,
                      page_size: page_size
                  ).entries
                end

                ##
                # Streams ThisMonthInstance records from the API as an Enumerable.
                # This operation lazily loads records as efficiently as possible until the limit
                # is reached.
                # @param [this_month.Category] category The category
                # @param [Date] start_date The start_date
                # @param [Date] end_date The end_date
                # @param [Integer] limit Upper limit for the number of records to return.                  stream()
                #  guarantees to never return more than limit.                  Default is no limit
                # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
                #  the default value of 50 records.                      If no page_size is defined
                #                       but a limit is defined, stream() will attempt to                      read the
                #  limit with the most efficient page size,                       i.e. min(limit, 1000)
                # @return [Enumerable] Enumerable that will yield up to limit results
                def stream(category: Twilio::Values::Unset, start_date: Twilio::Values::Unset, end_date: Twilio::Values::Unset, limit: nil, page_size: nil)
                  limits = @version.read_limits(limit, page_size)

                  page = self.page(
                      category: category,
                      start_date: start_date,
                      end_date: end_date,
                      page_size: limits[:page_size],
                  )

                  @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                end

                ##
                # When passed a block, yields ThisMonthInstance records from the API.
                # This operation lazily loads records as efficiently as possible until the limit
                # is reached.
                # @param [this_month.Category] category The category
                # @param [Date] start_date The start_date
                # @param [Date] end_date The end_date
                # @param [Integer] limit Upper limit for the number of records to return.                  stream()
                #  guarantees to never return more than limit.                  Default is no limit
                # @param [Integer] page_size Number of records to fetch per request, when                       not set will use
                #  the default value of 50 records.                      If no page_size is defined
                #                       but a limit is defined, stream() will attempt to read the
                #                       limit with the most efficient page size, i.e. min(limit, 1000)
                def each
                  limits = @version.read_limits

                  page = self.page(
                      page_size: limits[:page_size],
                  )

                  @version.stream(page,
                                  limit: limits[:limit],
                                  page_limit: limits[:page_limit]).each {|x| yield x}
                end

                ##
                # Retrieve a single page of ThisMonthInstance records from the API.
                # Request is executed immediately.
                # @param [this_month.Category] category The category
                # @param [Date] start_date The start_date
                # @param [Date] end_date The end_date
                # @param [String] page_token PageToken provided by the API
                # @param [Integer] page_number Page Number, this value is simply for client state
                # @param [Integer] page_size Number of records to return, defaults to 50
                # @return [Page] Page of ThisMonthInstance
                def page(category: Twilio::Values::Unset, start_date: Twilio::Values::Unset, end_date: Twilio::Values::Unset, page_token: Twilio::Values::Unset, page_number: Twilio::Values::Unset, page_size: Twilio::Values.Unset)
                  params = Twilio::Values.of({
                      'Category' => category,
                      'StartDate' => Twilio.serialize_iso8601(start_date),
                      'EndDate' => Twilio.serialize_iso8601(end_date),
                      'PageToken' => page_token,
                      'Page' => page_number,
                      'PageSize' => page_size,
                  })
                  response = @version.page(
                      'GET',
                      @uri,
                      params
                  )
                  return ThisMonthPage.new(@version, response, @solution)
                end

                ##
                # Retrieve a single page of ThisMonthInstance records from the API.
                # Request is executed immediately.
                # @param [String] target_url API-generated URL for the requested results page
                # @return [Page] Page of ThisMonthInstance
                def get_page(target_url: nil)
                  response = @version.domain.request(
                      'GET',
                      target_url
                  )
                  return ThisMonthPage.new(@version, response, @solution)
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '#<Twilio.Api.V2010.ThisMonthList>'
                end
              end

              class ThisMonthPage < Page
                ##
                # Initialize the ThisMonthPage
                # @param [Version] version Version that contains the resource
                # @param [Response] response Response from the API
                # @param [Hash] solution Path solution for the resource
                # @param [String] account_sid A 34 character string that uniquely identifies this
                #   resource.
                # @return [ThisMonthPage] ThisMonthPage
                def initialize(version, response, solution)
                  super(version, response)

                  # Path Solution
                  @solution = solution
                end

                ##
                # Build an instance of ThisMonthInstance
                # @param [Hash] payload Payload response from the API
                # @return [ThisMonthInstance] ThisMonthInstance
                def get_instance(payload)
                  return ThisMonthInstance.new(
                      @version,
                      payload,
                      account_sid: @solution[:account_sid],
                  )
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '<Twilio.Api.V2010.ThisMonthPage>'
                end
              end

              class ThisMonthInstance < InstanceResource
                ##
                # Initialize the ThisMonthInstance
                # @param [Version] version Version that contains the resource
                # @param [Hash] payload payload that contains response from Twilio
                # @param [String] account_sid A 34 character string that uniquely identifies this
                #   resource.
                # @return [ThisMonthInstance] ThisMonthInstance
                def initialize(version, payload, account_sid: nil)
                  super(version)

                  # Marshaled Properties
                  @properties = {
                      'account_sid' => payload['account_sid'],
                      'api_version' => payload['api_version'],
                      'category' => payload['category'],
                      'count' => payload['count'],
                      'count_unit' => payload['count_unit'],
                      'description' => payload['description'],
                      'end_date' => payload['end_date'],
                      'price' => payload['price'].to_f,
                      'price_unit' => payload['price_unit'],
                      'start_date' => payload['start_date'],
                      'subresource_uris' => payload['subresource_uris'],
                      'uri' => payload['uri'],
                      'usage' => payload['usage'],
                      'usage_unit' => payload['usage_unit'],
                  }
                end

                def account_sid
                  @properties['account_sid']
                end

                def api_version
                  @properties['api_version']
                end

                def category
                  @properties['category']
                end

                def count
                  @properties['count']
                end

                def count_unit
                  @properties['count_unit']
                end

                def description
                  @properties['description']
                end

                def end_date
                  @properties['end_date']
                end

                def price
                  @properties['price']
                end

                def price_unit
                  @properties['price_unit']
                end

                def start_date
                  @properties['start_date']
                end

                def subresource_uris
                  @properties['subresource_uris']
                end

                def uri
                  @properties['uri']
                end

                def usage
                  @properties['usage']
                end

                def usage_unit
                  @properties['usage_unit']
                end

                ##
                # Provide a user friendly representation
                def to_s
                  "<Twilio.Api.V2010.ThisMonthInstance>"
                end
              end
            end
          end
        end
      end
    end
  end
end