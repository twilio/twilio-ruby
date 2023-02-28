##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Pricing
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Pricing < PricingBase
            class V1 < Version
                class PhoneNumberList < ListResource

                     class CountryList < ListResource
                    ##
                    # Initialize the CountryList
                    # @param [Version] version Version that contains the resource
                    # @return [CountryList] CountryList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/PhoneNumbers/Countries"
                        
                    end
                
                    ##
                    # Lists CountryInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(limit: nil, page_size: nil)
                        self.stream(
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields CountryInstance records from the API.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    def each
                        limits = @version.read_limits

                        page = self.page(page_size: limits[:page_size], )

                        @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
                    end

                    ##
                    # Retrieve a single page of CountryInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of CountryInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        CountryPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of CountryInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of CountryInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    CountryPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Pricing.V1.CountryList>'
                    end
                end

                class CountryContext < InstanceContext
                    ##
                    # Initialize the CountryContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] iso_country The [ISO country code](http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the pricing information to fetch.
                    # @return [CountryContext] CountryContext
                    def initialize(version, iso_country)
                        super(version)

                        # Path Solution
                        @solution = { iso_country: iso_country,  }
                        @uri = "/PhoneNumbers/Countries/#{@solution[:iso_country]}"

                        
                    end
                    ##
                    # Fetch the CountryInstance
                    # @return [CountryInstance] Fetched CountryInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        CountryInstance.new(
                            @version,
                            payload,
                            iso_country: @solution[:iso_country],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Pricing.V1.CountryContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Pricing.V1.CountryContext #{context}>"
                    end
                end

                class CountryPage < Page
                    ##
                    # Initialize the CountryPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [CountryPage] CountryPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of CountryInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [CountryInstance] CountryInstance
                    def get_instance(payload)
                        CountryInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Pricing.V1.CountryPage>'
                    end
                end
                class CountryInstance < InstanceResource
                    ##
                    # Initialize the CountryInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Country
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [CountryInstance] CountryInstance
                    def initialize(version, payload , iso_country: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'country' => payload['country'],
                            'iso_country' => payload['iso_country'],
                            'phone_number_prices' => payload['phone_number_prices'],
                            'price_unit' => payload['price_unit'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'iso_country' => iso_country  || @properties['iso_country']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [CountryContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = CountryContext.new(@version , @params['iso_country'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The name of the country.
                    def country
                        @properties['country']
                    end
                    
                    ##
                    # @return [String] The [ISO country code](http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2).
                    def iso_country
                        @properties['iso_country']
                    end
                    
                    ##
                    # @return [Array<PricingV1PhoneNumberPhoneNumberCountryInstancePhoneNumberPrices>] The list of [PhoneNumberPrice](https://www.twilio.com/docs/phone-numbers/pricing#phone-number-price) records.
                    def phone_number_prices
                        @properties['phone_number_prices']
                    end
                    
                    ##
                    # @return [String] The currency in which prices are measured, specified in [ISO 4127](http://www.iso.org/iso/home/standards/currency_codes.htm) format (e.g. `usd`, `eur`, `jpy`).
                    def price_unit
                        @properties['price_unit']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Fetch the CountryInstance
                    # @return [CountryInstance] Fetched CountryInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Pricing.V1.CountryInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Pricing.V1.CountryInstance #{values}>"
                    end
                end
             end
            end
        end
    end
end


