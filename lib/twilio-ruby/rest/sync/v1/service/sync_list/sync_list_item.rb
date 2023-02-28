##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Sync
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Sync < SyncBase
            class V1 < Version
                class ServiceContext < InstanceContext
                class SyncListContext < InstanceContext

                     class SyncListItemList < ListResource
                    ##
                    # Initialize the SyncListItemList
                    # @param [Version] version Version that contains the resource
                    # @return [SyncListItemList] SyncListItemList
                    def initialize(version, service_sid: nil, list_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { service_sid: service_sid,list_sid: list_sid, }
                        @uri = "/Services/#{@solution[:service_sid]}/Lists/#{@solution[:list_sid]}/Items"
                        
                    end
                    ##
                    # Create the SyncListItemInstance
                    # @param [Object] data A JSON string that represents an arbitrary, schema-less object that the List Item stores. Can be up to 16 KiB in length.
                    # @param [String] ttl An alias for `item_ttl`. If both parameters are provided, this value is ignored.
                    # @param [String] item_ttl How long, [in seconds](https://www.twilio.com/docs/sync/limits#sync-payload-limits), before the List Item expires (time-to-live) and is deleted.
                    # @param [String] collection_ttl How long, [in seconds](https://www.twilio.com/docs/sync/limits#sync-payload-limits), before the List Item's parent Sync List expires (time-to-live) and is deleted.
                    # @return [SyncListItemInstance] Created SyncListItemInstance
                    def create(
                        data: nil, 
                        ttl: :unset, 
                        item_ttl: :unset, 
                        collection_ttl: :unset
                    )

                        data = Twilio::Values.of({
                            'Data' => Twilio.serialize_object(data),
                            'Ttl' => ttl,
                            'ItemTtl' => item_ttl,
                            'CollectionTtl' => collection_ttl,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        SyncListItemInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            list_sid: @solution[:list_sid],
                        )
                    end

                
                    ##
                    # Lists SyncListItemInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [SyncListItemQueryResultOrder] order How to order the List Items returned by their `index` value. Can be: `asc` (ascending) or `desc` (descending) and the default is ascending.
                    # @param [String] from The `index` of the first Sync List Item resource to read. See also `bounds`.
                    # @param [SyncListItemQueryFromBoundType] bounds Whether to include the List Item referenced by the `from` parameter. Can be: `inclusive` to include the List Item referenced by the `from` parameter or `exclusive` to start with the next List Item. The default value is `inclusive`.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(order: :unset, from: :unset, bounds: :unset, limit: nil, page_size: nil)
                        self.stream(
                            order: order,
                            from: from,
                            bounds: bounds,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [SyncListItemQueryResultOrder] order How to order the List Items returned by their `index` value. Can be: `asc` (ascending) or `desc` (descending) and the default is ascending.
                    # @param [String] from The `index` of the first Sync List Item resource to read. See also `bounds`.
                    # @param [SyncListItemQueryFromBoundType] bounds Whether to include the List Item referenced by the `from` parameter. Can be: `inclusive` to include the List Item referenced by the `from` parameter or `exclusive` to start with the next List Item. The default value is `inclusive`.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(order: :unset, from: :unset, bounds: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            order: order,
                            from: from,
                            bounds: bounds,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields SyncListItemInstance records from the API.
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
                    # Retrieve a single page of SyncListItemInstance records from the API.
                    # Request is executed immediately.
                    # @param [SyncListItemQueryResultOrder] order How to order the List Items returned by their `index` value. Can be: `asc` (ascending) or `desc` (descending) and the default is ascending.
                    # @param [String] from The `index` of the first Sync List Item resource to read. See also `bounds`.
                    # @param [SyncListItemQueryFromBoundType] bounds Whether to include the List Item referenced by the `from` parameter. Can be: `inclusive` to include the List Item referenced by the `from` parameter or `exclusive` to start with the next List Item. The default value is `inclusive`.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of SyncListItemInstance
                    def page(order: :unset, from: :unset, bounds: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'Order' => order,
                            
                            'From' => from,
                            
                            'Bounds' => bounds,
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        SyncListItemPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of SyncListItemInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of SyncListItemInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    SyncListItemPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Sync.V1.SyncListItemList>'
                    end
                end

                class SyncListItemContext < InstanceContext
                    ##
                    # Initialize the SyncListItemContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] service_sid The SID of the [Sync Service](https://www.twilio.com/docs/sync/api/service) with the Sync List Item resource to update.
                    # @param [String] list_sid The SID of the Sync List with the Sync List Item resource to update. Can be the Sync List resource's `sid` or its `unique_name`.
                    # @param [String] index The index of the Sync List Item resource to update.
                    # @return [SyncListItemContext] SyncListItemContext
                    def initialize(version, service_sid, list_sid, index)
                        super(version)

                        # Path Solution
                        @solution = { service_sid: service_sid, list_sid: list_sid, index: index,  }
                        @uri = "/Services/#{@solution[:service_sid]}/Lists/#{@solution[:list_sid]}/Items/#{@solution[:index]}"

                        
                    end
                    ##
                    # Delete the SyncListItemInstance
                    # @param [String] if_match If provided, applies this mutation if (and only if) the “revision” field of this [map item] matches the provided value. This matches the semantics of (and is implemented with) the HTTP [If-Match header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/If-Match).
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete(
                        if_match: :unset
                    )

                        headers = Twilio::Values.of({ 'If-Match' => if_match, })
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the SyncListItemInstance
                    # @return [SyncListItemInstance] Fetched SyncListItemInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        SyncListItemInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            list_sid: @solution[:list_sid],
                            index: @solution[:index],
                        )
                    end

                    ##
                    # Update the SyncListItemInstance
                    # @param [Object] data A JSON string that represents an arbitrary, schema-less object that the List Item stores. Can be up to 16 KiB in length.
                    # @param [String] ttl An alias for `item_ttl`. If both parameters are provided, this value is ignored.
                    # @param [String] item_ttl How long, [in seconds](https://www.twilio.com/docs/sync/limits#sync-payload-limits), before the List Item expires (time-to-live) and is deleted.
                    # @param [String] collection_ttl How long, [in seconds](https://www.twilio.com/docs/sync/limits#sync-payload-limits), before the List Item's parent Sync List expires (time-to-live) and is deleted. This parameter can only be used when the List Item's `data` or `ttl` is updated in the same request.
                    # @param [String] if_match If provided, applies this mutation if (and only if) the “revision” field of this [map item] matches the provided value. This matches the semantics of (and is implemented with) the HTTP [If-Match header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/If-Match).
                    # @return [SyncListItemInstance] Updated SyncListItemInstance
                    def update(
                        data: :unset, 
                        ttl: :unset, 
                        item_ttl: :unset, 
                        collection_ttl: :unset, 
                        if_match: :unset
                    )

                        data = Twilio::Values.of({
                            'Data' => Twilio.serialize_object(data),
                            'Ttl' => ttl,
                            'ItemTtl' => item_ttl,
                            'CollectionTtl' => collection_ttl,
                        })

                        headers = Twilio::Values.of({ 'If-Match' => if_match, })
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        SyncListItemInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            list_sid: @solution[:list_sid],
                            index: @solution[:index],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Sync.V1.SyncListItemContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Sync.V1.SyncListItemContext #{context}>"
                    end
                end

                class SyncListItemPage < Page
                    ##
                    # Initialize the SyncListItemPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [SyncListItemPage] SyncListItemPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of SyncListItemInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [SyncListItemInstance] SyncListItemInstance
                    def get_instance(payload)
                        SyncListItemInstance.new(@version, payload, service_sid: @solution[:service_sid], list_sid: @solution[:list_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Sync.V1.SyncListItemPage>'
                    end
                end
                class SyncListItemInstance < InstanceResource
                    ##
                    # Initialize the SyncListItemInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this SyncListItem
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [SyncListItemInstance] SyncListItemInstance
                    def initialize(version, payload , service_sid: nil, list_sid: nil, index: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'index' => payload['index'] == nil ? payload['index'] : payload['index'].to_i,
                            'account_sid' => payload['account_sid'],
                            'service_sid' => payload['service_sid'],
                            'list_sid' => payload['list_sid'],
                            'url' => payload['url'],
                            'revision' => payload['revision'],
                            'data' => payload['data'],
                            'date_expires' => Twilio.deserialize_iso8601_datetime(payload['date_expires']),
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'created_by' => payload['created_by'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'service_sid' => service_sid  || @properties['service_sid']  ,'list_sid' => list_sid  || @properties['list_sid']  ,'index' => index  || @properties['index']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [SyncListItemContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = SyncListItemContext.new(@version , @params['service_sid'], @params['list_sid'], @params['index'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The automatically generated index of the List Item. The `index` values of the List Items in a Sync List can have gaps in their sequence.
                    def index
                        @properties['index']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the List Item resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Sync Service](https://www.twilio.com/docs/sync/api/service) the resource is associated with.
                    def service_sid
                        @properties['service_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the Sync List that contains the List Item.
                    def list_sid
                        @properties['list_sid']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the List Item resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [String] The current revision of the item, represented as a string.
                    def revision
                        @properties['revision']
                    end
                    
                    ##
                    # @return [Hash] An arbitrary, schema-less object that the List Item stores. Can be up to 16 KiB in length.
                    def data
                        @properties['data']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the List Item expires and will be deleted, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. If the List Item does not expire, this value is `null`. The List Item resource might not be deleted immediately after it expires.
                    def date_expires
                        @properties['date_expires']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The identity of the List Item's creator. If the item is created from the client SDK, the value matches the Access Token's `identity` field. If the item was created from the REST API, the value is `system`.
                    def created_by
                        @properties['created_by']
                    end
                    
                    ##
                    # Delete the SyncListItemInstance
                    # @param [String] if_match If provided, applies this mutation if (and only if) the “revision” field of this [map item] matches the provided value. This matches the semantics of (and is implemented with) the HTTP [If-Match header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/If-Match).
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete(
                        if_match: :unset
                    )

                        context.delete(
                            if_match: if_match, 
                        )
                    end

                    ##
                    # Fetch the SyncListItemInstance
                    # @return [SyncListItemInstance] Fetched SyncListItemInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the SyncListItemInstance
                    # @param [Object] data A JSON string that represents an arbitrary, schema-less object that the List Item stores. Can be up to 16 KiB in length.
                    # @param [String] ttl An alias for `item_ttl`. If both parameters are provided, this value is ignored.
                    # @param [String] item_ttl How long, [in seconds](https://www.twilio.com/docs/sync/limits#sync-payload-limits), before the List Item expires (time-to-live) and is deleted.
                    # @param [String] collection_ttl How long, [in seconds](https://www.twilio.com/docs/sync/limits#sync-payload-limits), before the List Item's parent Sync List expires (time-to-live) and is deleted. This parameter can only be used when the List Item's `data` or `ttl` is updated in the same request.
                    # @param [String] if_match If provided, applies this mutation if (and only if) the “revision” field of this [map item] matches the provided value. This matches the semantics of (and is implemented with) the HTTP [If-Match header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/If-Match).
                    # @return [SyncListItemInstance] Updated SyncListItemInstance
                    def update(
                        data: :unset, 
                        ttl: :unset, 
                        item_ttl: :unset, 
                        collection_ttl: :unset, 
                        if_match: :unset
                    )

                        context.update(
                            data: data, 
                            ttl: ttl, 
                            item_ttl: item_ttl, 
                            collection_ttl: collection_ttl, 
                            if_match: if_match, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Sync.V1.SyncListItemInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Sync.V1.SyncListItemInstance #{values}>"
                    end
                end
             end
             end
            end
        end
    end
end


