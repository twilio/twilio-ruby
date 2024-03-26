##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Content
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Content < ContentBase
            class V1 < Version
                class ContentList < ListResource

                    class AuthenticationAction
                            # @param [type]: [AuthenticationActionType]
                            # @param [copy_code_text]: [String]
                        attr_accessor :type, :copy_code_text
                        def initialize(payload)
                                @type = payload["type"]
                                @copy_code_text = payload["copy_code_text"]
                        end
                        def to_json(options = {})
                        {
                                type: @type,
                                copy_code_text: @copy_code_text,
                        }.to_json(options)
                        end
                    end

                    class CallToActionAction
                            # @param [type]: [CallToActionActionType]
                            # @param [title]: [String]
                            # @param [url]: [String]
                            # @param [phone]: [String]
                            # @param [id]: [String]
                        attr_accessor :type, :title, :url, :phone, :id
                        def initialize(payload)
                                @type = payload["type"]
                                @title = payload["title"]
                                @url = payload["url"]
                                @phone = payload["phone"]
                                @id = payload["id"]
                        end
                        def to_json(options = {})
                        {
                                type: @type,
                                title: @title,
                                url: @url,
                                phone: @phone,
                                id: @id,
                        }.to_json(options)
                        end
                    end

                    class CardAction
                            # @param [type]: [CardActionType]
                            # @param [title]: [String]
                            # @param [url]: [String]
                            # @param [phone]: [String]
                            # @param [id]: [String]
                        attr_accessor :type, :title, :url, :phone, :id
                        def initialize(payload)
                                @type = payload["type"]
                                @title = payload["title"]
                                @url = payload["url"]
                                @phone = payload["phone"]
                                @id = payload["id"]
                        end
                        def to_json(options = {})
                        {
                                type: @type,
                                title: @title,
                                url: @url,
                                phone: @phone,
                                id: @id,
                        }.to_json(options)
                        end
                    end

                    class CatalogItem
                            # @param [id]: [String]
                            # @param [section_title]: [String]
                            # @param [name]: [String]
                            # @param [media_url]: [String]
                            # @param [price]: [Float]
                            # @param [description]: [String]
                        attr_accessor :id, :section_title, :name, :media_url, :price, :description
                        def initialize(payload)
                                @id = payload["id"]
                                @section_title = payload["section_title"]
                                @name = payload["name"]
                                @media_url = payload["media_url"]
                                @price = payload["price"]
                                @description = payload["description"]
                        end
                        def to_json(options = {})
                        {
                                id: @id,
                                section_title: @section_title,
                                name: @name,
                                media_url: @media_url,
                                price: @price,
                                description: @description,
                        }.to_json(options)
                        end
                    end

                    class ContentCreateRequest
                            # @param [friendly_name]: [String] User defined name of the content
                            # @param [variables]: [Hash<String, String>] Key value pairs of variable name to value
                            # @param [language]: [String] Language code for the content
                            # @param [types]: [ContentList.Types]
                        attr_accessor :friendly_name, :variables, :language, :types
                        def initialize(payload)
                                @friendly_name = payload["friendly_name"]
                                @variables = payload["variables"]
                                @language = payload["language"]
                                @types = payload["types"]
                        end
                        def to_json(options = {})
                        {
                                friendly_name: @friendly_name,
                                variables: @variables,
                                language: @language,
                                types: @types,
                        }.to_json(options)
                        end
                    end

                    class ListItem
                            # @param [id]: [String]
                            # @param [item]: [String]
                            # @param [description]: [String]
                        attr_accessor :id, :item, :description
                        def initialize(payload)
                                @id = payload["id"]
                                @item = payload["item"]
                                @description = payload["description"]
                        end
                        def to_json(options = {})
                        {
                                id: @id,
                                item: @item,
                                description: @description,
                        }.to_json(options)
                        end
                    end

                    class QuickReplyAction
                            # @param [type]: [QuickReplyActionType]
                            # @param [title]: [String]
                            # @param [id]: [String]
                        attr_accessor :type, :title, :id
                        def initialize(payload)
                                @type = payload["type"]
                                @title = payload["title"]
                                @id = payload["id"]
                        end
                        def to_json(options = {})
                        {
                                type: @type,
                                title: @title,
                                id: @id,
                        }.to_json(options)
                        end
                    end

                    class TwilioCallToAction
                            # @param [body]: [String]
                            # @param [actions]: [Array<ContentList.CallToActionAction>]
                        attr_accessor :body, :actions
                        def initialize(payload)
                                @body = payload["body"]
                                @actions = payload["actions"]
                        end
                        def to_json(options = {})
                        {
                                body: @body,
                                actions: @actions,
                        }.to_json(options)
                        end
                    end

                    class TwilioCard
                            # @param [title]: [String]
                            # @param [subtitle]: [String]
                            # @param [media]: [Array<String>]
                            # @param [actions]: [Array<ContentList.CardAction>]
                        attr_accessor :title, :subtitle, :media, :actions
                        def initialize(payload)
                                @title = payload["title"]
                                @subtitle = payload["subtitle"]
                                @media = payload["media"]
                                @actions = payload["actions"]
                        end
                        def to_json(options = {})
                        {
                                title: @title,
                                subtitle: @subtitle,
                                media: @media,
                                actions: @actions,
                        }.to_json(options)
                        end
                    end

                    class TwilioCatalog
                            # @param [title]: [String]
                            # @param [body]: [String]
                            # @param [subtitle]: [String]
                            # @param [id]: [String]
                            # @param [items]: [Array<ContentList.CatalogItem>]
                            # @param [dynamic_items]: [String]
                        attr_accessor :title, :body, :subtitle, :id, :items, :dynamic_items
                        def initialize(payload)
                                @title = payload["title"]
                                @body = payload["body"]
                                @subtitle = payload["subtitle"]
                                @id = payload["id"]
                                @items = payload["items"]
                                @dynamic_items = payload["dynamic_items"]
                        end
                        def to_json(options = {})
                        {
                                title: @title,
                                body: @body,
                                subtitle: @subtitle,
                                id: @id,
                                items: @items,
                                dynamic_items: @dynamic_items,
                        }.to_json(options)
                        end
                    end

                    class TwilioListPicker
                            # @param [body]: [String]
                            # @param [button]: [String]
                            # @param [items]: [Array<ContentList.ListItem>]
                        attr_accessor :body, :button, :items
                        def initialize(payload)
                                @body = payload["body"]
                                @button = payload["button"]
                                @items = payload["items"]
                        end
                        def to_json(options = {})
                        {
                                body: @body,
                                button: @button,
                                items: @items,
                        }.to_json(options)
                        end
                    end

                    class TwilioLocation
                            # @param [latitude]: [Float]
                            # @param [longitude]: [Float]
                            # @param [label]: [String]
                        attr_accessor :latitude, :longitude, :label
                        def initialize(payload)
                                @latitude = payload["latitude"]
                                @longitude = payload["longitude"]
                                @label = payload["label"]
                        end
                        def to_json(options = {})
                        {
                                latitude: @latitude,
                                longitude: @longitude,
                                label: @label,
                        }.to_json(options)
                        end
                    end

                    class TwilioMedia
                            # @param [body]: [String]
                            # @param [media]: [Array<String>]
                        attr_accessor :body, :media
                        def initialize(payload)
                                @body = payload["body"]
                                @media = payload["media"]
                        end
                        def to_json(options = {})
                        {
                                body: @body,
                                media: @media,
                        }.to_json(options)
                        end
                    end

                    class TwilioQuickReply
                            # @param [body]: [String]
                            # @param [actions]: [Array<ContentList.QuickReplyAction>]
                        attr_accessor :body, :actions
                        def initialize(payload)
                                @body = payload["body"]
                                @actions = payload["actions"]
                        end
                        def to_json(options = {})
                        {
                                body: @body,
                                actions: @actions,
                        }.to_json(options)
                        end
                    end

                    class TwilioText
                            # @param [body]: [String]
                        attr_accessor :body
                        def initialize(payload)
                                @body = payload["body"]
                        end
                        def to_json(options = {})
                        {
                                body: @body,
                        }.to_json(options)
                        end
                    end

                    class Types
                            # @param [twilio_text]: [ContentList.TwilioText]
                            # @param [twilio_media]: [ContentList.TwilioMedia]
                            # @param [twilio_location]: [ContentList.TwilioLocation]
                            # @param [twilio_list_picker]: [ContentList.TwilioListPicker]
                            # @param [twilio_call_to_action]: [ContentList.TwilioCallToAction]
                            # @param [twilio_quick_reply]: [ContentList.TwilioQuickReply]
                            # @param [twilio_card]: [ContentList.TwilioCard]
                            # @param [twilio_catalog]: [ContentList.TwilioCatalog]
                            # @param [whatsapp_card]: [ContentList.WhatsappCard]
                            # @param [whatsapp_authentication]: [ContentList.WhatsappAuthentication]
                        attr_accessor :twilio_text, :twilio_media, :twilio_location, :twilio_list_picker, :twilio_call_to_action, :twilio_quick_reply, :twilio_card, :twilio_catalog, :whatsapp_card, :whatsapp_authentication
                        def initialize(payload)
                                @twilio_text = payload["twilio_text"]
                                @twilio_media = payload["twilio_media"]
                                @twilio_location = payload["twilio_location"]
                                @twilio_list_picker = payload["twilio_list_picker"]
                                @twilio_call_to_action = payload["twilio_call_to_action"]
                                @twilio_quick_reply = payload["twilio_quick_reply"]
                                @twilio_card = payload["twilio_card"]
                                @twilio_catalog = payload["twilio_catalog"]
                                @whatsapp_card = payload["whatsapp_card"]
                                @whatsapp_authentication = payload["whatsapp_authentication"]
                        end
                        def to_json(options = {})
                        {
                                twilio_text: @twilio_text,
                                twilio_media: @twilio_media,
                                twilio_location: @twilio_location,
                                twilio_list_picker: @twilio_list_picker,
                                twilio_call_to_action: @twilio_call_to_action,
                                twilio_quick_reply: @twilio_quick_reply,
                                twilio_card: @twilio_card,
                                twilio_catalog: @twilio_catalog,
                                whatsapp_card: @whatsapp_card,
                                whatsapp_authentication: @whatsapp_authentication,
                        }.to_json(options)
                        end
                    end

                    class WhatsappAuthentication
                            # @param [add_security_recommendation]: [Boolean]
                            # @param [code_expiration_minutes]: [Float]
                            # @param [actions]: [Array<ContentList.AuthenticationAction>]
                        attr_accessor :add_security_recommendation, :code_expiration_minutes, :actions
                        def initialize(payload)
                                @add_security_recommendation = payload["add_security_recommendation"]
                                @code_expiration_minutes = payload["code_expiration_minutes"]
                                @actions = payload["actions"]
                        end
                        def to_json(options = {})
                        {
                                add_security_recommendation: @add_security_recommendation,
                                code_expiration_minutes: @code_expiration_minutes,
                                actions: @actions,
                        }.to_json(options)
                        end
                    end

                    class WhatsappCard
                            # @param [body]: [String]
                            # @param [footer]: [String]
                            # @param [media]: [Array<String>]
                            # @param [header_text]: [String]
                            # @param [actions]: [Array<ContentList.CardAction>]
                        attr_accessor :body, :footer, :media, :header_text, :actions
                        def initialize(payload)
                                @body = payload["body"]
                                @footer = payload["footer"]
                                @media = payload["media"]
                                @header_text = payload["header_text"]
                                @actions = payload["actions"]
                        end
                        def to_json(options = {})
                        {
                                body: @body,
                                footer: @footer,
                                media: @media,
                                header_text: @header_text,
                                actions: @actions,
                        }.to_json(options)
                        end
                    end

                    ##
                    # Initialize the ContentList
                    # @param [Version] version Version that contains the resource
                    # @return [ContentList] ContentList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Content"

                    end
                    ##
                    # Create the ContentInstance
                    # @param [ContentCreateRequest] content_create_request
                    # @return [ContentInstance] Created ContentInstance
                    def create(content_create_request: nil
                    )

                        headers = Twilio::Values.of({"Content-Type"=> "application/json"})
                        payload = @version.create('POST', @uri, data: content_create_request.to_json, headers: headers)
                        ContentInstance.new(
                            @version,
                            payload,
                        )
                    end


                    ##
                    # Lists ContentInstance records from the API as a list.
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
                    # When passed a block, yields ContentInstance records from the API.
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
                    # Retrieve a single page of ContentInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of ContentInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        ContentPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of ContentInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of ContentInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    ContentPage.new(@version, response, @solution)
                    end



                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Content.V1.ContentList>'
                    end
                end


                class ContentContext < InstanceContext
                    ##
                    # Initialize the ContentContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The Twilio-provided string that uniquely identifies the Content resource to fetch.
                    # @return [ContentContext] ContentContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/Content/#{@solution[:sid]}"

                        # Dependents
                        @approval_create = nil
                        @approval_fetch = nil
                    end
                    ##
                    # Delete the ContentInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete


                        @version.delete('DELETE', @uri)
                    end

                    ##
                    # Fetch the ContentInstance
                    # @return [ContentInstance] Fetched ContentInstance
                    def fetch


                        payload = @version.fetch('GET', @uri)
                        ContentInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the approval_create
                    # @return [ApprovalCreateList]
                    # @return [ApprovalCreateContext]
                    def approval_create
                      unless @approval_create
                        @approval_create = ApprovalCreateList.new(
                                @version, content_sid: @solution[:sid], )
                      end
                      @approval_create
                    end
                    ##
                    # Access the approval_fetch
                    # @return [ApprovalFetchList]
                    # @return [ApprovalFetchContext]
                    def approval_fetch
                        ApprovalFetchContext.new(
                                @version,
                                @solution[:sid]
                                )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Content.V1.ContentContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Content.V1.ContentContext #{context}>"
                    end
                end

                class ContentPage < Page
                    ##
                    # Initialize the ContentPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [ContentPage] ContentPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of ContentInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [ContentInstance] ContentInstance
                    def get_instance(payload)
                        ContentInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Content.V1.ContentPage>'
                    end
                end
                class ContentInstance < InstanceResource
                    ##
                    # Initialize the ContentInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Content
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [ContentInstance] ContentInstance
                    def initialize(version, payload , sid: nil)
                        super(version)

                        # Marshaled Properties
                        @properties = {
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'friendly_name' => payload['friendly_name'],
                            'language' => payload['language'],
                            'variables' => payload['variables'],
                            'types' => payload['types'],
                            'url' => payload['url'],
                            'links' => payload['links'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [ContentContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = ContentContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end

                    ##
                    # @return [Time] The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_created
                        @properties['date_created']
                    end

                    ##
                    # @return [Time] The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_updated
                        @properties['date_updated']
                    end

                    ##
                    # @return [String] The unique string that that we created to identify the Content resource.
                    def sid
                        @properties['sid']
                    end

                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/usage/api/account) that created Content resource.
                    def account_sid
                        @properties['account_sid']
                    end

                    ##
                    # @return [String] A string name used to describe the Content resource. Not visible to the end recipient.
                    def friendly_name
                        @properties['friendly_name']
                    end

                    ##
                    # @return [String] Two-letter (ISO 639-1) language code (e.g., en) identifying the language the Content resource is in.
                    def language
                        @properties['language']
                    end

                    ##
                    # @return [Hash] Defines the default placeholder values for variables included in the Content resource. e.g. {\"1\": \"Customer_Name\"}.
                    def variables
                        @properties['variables']
                    end

                    ##
                    # @return [Hash] The [Content types](https://www.twilio.com/docs/content-api/content-types-overview) (e.g. twilio/text) for this Content resource.
                    def types
                        @properties['types']
                    end

                    ##
                    # @return [String] The URL of the resource, relative to `https://content.twilio.com`.
                    def url
                        @properties['url']
                    end

                    ##
                    # @return [Hash] A list of links related to the Content resource, such as approval_fetch and approval_create
                    def links
                        @properties['links']
                    end

                    ##
                    # Delete the ContentInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the ContentInstance
                    # @return [ContentInstance] Fetched ContentInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Access the approval_create
                    # @return [approval_create] approval_create
                    def approval_create
                        context.approval_create
                    end

                    ##
                    # Access the approval_fetch
                    # @return [approval_fetch] approval_fetch
                    def approval_fetch
                        context.approval_fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Content.V1.ContentInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Content.V1.ContentInstance #{values}>"
                    end
                end

            end
        end
    end
end
