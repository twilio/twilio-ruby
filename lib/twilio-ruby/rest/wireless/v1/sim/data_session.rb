##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Wireless
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Wireless < WirelessBase
            class V1 < Version
                class SimContext < InstanceContext

                     class DataSessionList < ListResource
                
                    ##
                    # Initialize the DataSessionList
                    # @param [Version] version Version that contains the resource
                    # @return [DataSessionList] DataSessionList
                    def initialize(version, sim_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { sim_sid: sim_sid }
                        @uri = "/Sims/#{@solution[:sim_sid]}/DataSessions"
                        
                    end
                
                    ##
                    # Lists DataSessionInstance records from the API as a list.
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
                    # When passed a block, yields DataSessionInstance records from the API.
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
                    # Retrieve a single page of DataSessionInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of DataSessionInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        DataSessionPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of DataSessionInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of DataSessionInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    DataSessionPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Wireless.V1.DataSessionList>'
                    end
                end

                class DataSessionPage < Page
                    ##
                    # Initialize the DataSessionPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [DataSessionPage] DataSessionPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of DataSessionInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [DataSessionInstance] DataSessionInstance
                    def get_instance(payload)
                        DataSessionInstance.new(@version, payload, sim_sid: @solution[:sim_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Wireless.V1.DataSessionPage>'
                    end
                end
                class DataSessionInstance < InstanceResource
                    ##
                    # Initialize the DataSessionInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this DataSession
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [DataSessionInstance] DataSessionInstance
                    def initialize(version, payload , sim_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'sim_sid' => payload['sim_sid'],
                            'account_sid' => payload['account_sid'],
                            'radio_link' => payload['radio_link'],
                            'operator_mcc' => payload['operator_mcc'],
                            'operator_mnc' => payload['operator_mnc'],
                            'operator_country' => payload['operator_country'],
                            'operator_name' => payload['operator_name'],
                            'cell_id' => payload['cell_id'],
                            'cell_location_estimate' => payload['cell_location_estimate'],
                            'packets_uploaded' => payload['packets_uploaded'] == nil ? payload['packets_uploaded'] : payload['packets_uploaded'].to_i,
                            'packets_downloaded' => payload['packets_downloaded'] == nil ? payload['packets_downloaded'] : payload['packets_downloaded'].to_i,
                            'last_updated' => Twilio.deserialize_iso8601_datetime(payload['last_updated']),
                            'start' => Twilio.deserialize_iso8601_datetime(payload['start']),
                            '_end' => Twilio.deserialize_iso8601_datetime(payload['_end']),
                            'imei' => payload['imei'],
                        }
                    end

                    
                    ##
                    # @return [String] The unique string that we created to identify the DataSession resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Sim resource](https://www.twilio.com/docs/iot/wireless/api/sim-resource) that the Data Session is for.
                    def sim_sid
                        @properties['sim_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the DataSession resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The generation of wireless technology that the device was using.
                    def radio_link
                        @properties['radio_link']
                    end
                    
                    ##
                    # @return [String] The 'mobile country code' is the unique ID of the home country where the Data Session took place. See: [MCC/MNC lookup](http://mcc-mnc.com/).
                    def operator_mcc
                        @properties['operator_mcc']
                    end
                    
                    ##
                    # @return [String] The 'mobile network code' is the unique ID specific to the mobile operator network where the Data Session took place.
                    def operator_mnc
                        @properties['operator_mnc']
                    end
                    
                    ##
                    # @return [String] The three letter country code representing where the device's Data Session took place. This is determined by looking up the `operator_mcc`.
                    def operator_country
                        @properties['operator_country']
                    end
                    
                    ##
                    # @return [String] The friendly name of the mobile operator network that the [SIM](https://www.twilio.com/docs/iot/wireless/api/sim-resource)-connected device is attached to. This is determined by looking up the `operator_mnc`.
                    def operator_name
                        @properties['operator_name']
                    end
                    
                    ##
                    # @return [String] The unique ID of the cellular tower that the device was attached to at the moment when the Data Session was last updated.
                    def cell_id
                        @properties['cell_id']
                    end
                    
                    ##
                    # @return [Hash] An object that describes the estimated location in latitude and longitude where the device's Data Session took place. The location is derived from the `cell_id` when the Data Session was last updated. See [Cell Location Estimate Object](https://www.twilio.com/docs/iot/wireless/api/datasession-resource#cell-location-estimate-object). 
                    def cell_location_estimate
                        @properties['cell_location_estimate']
                    end
                    
                    ##
                    # @return [String] The number of packets uploaded by the device between the `start` time and when the Data Session was last updated.
                    def packets_uploaded
                        @properties['packets_uploaded']
                    end
                    
                    ##
                    # @return [String] The number of packets downloaded by the device between the `start` time and when the Data Session was last updated.
                    def packets_downloaded
                        @properties['packets_downloaded']
                    end
                    
                    ##
                    # @return [Time] The date that the resource was last updated, given as GMT in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.
                    def last_updated
                        @properties['last_updated']
                    end
                    
                    ##
                    # @return [Time] The date that the Data Session started, given as GMT in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.
                    def start
                        @properties['start']
                    end
                    
                    ##
                    # @return [Time] The date that the record ended, given as GMT in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.
                    def _end
                        @properties['_end']
                    end
                    
                    ##
                    # @return [String] The 'international mobile equipment identity' is the unique ID of the device using the SIM to connect. An IMEI is a 15-digit string: 14 digits for the device identifier plus a check digit calculated using the Luhn formula.
                    def imei
                        @properties['imei']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Wireless.V1.DataSessionInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Wireless.V1.DataSessionInstance>"
                    end
                end

             end
            end
        end
    end
end


