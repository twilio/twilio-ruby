##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Notify
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Notify < NotifyBase
            class V1 < Version
                class ServiceContext < InstanceContext

                     class NotificationList < ListResource
                
                    ##
                    # Initialize the NotificationList
                    # @param [Version] version Version that contains the resource
                    # @return [NotificationList] NotificationList
                    def initialize(version, service_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { service_sid: service_sid }
                        @uri = "/Services/#{@solution[:service_sid]}/Notifications"
                        
                    end
                    ##
                    # Create the NotificationInstance
                    # @param [String] body The notification text. For FCM and GCM, translates to `data.twi_body`. For APNS, translates to `aps.alert.body`. For SMS, translates to `body`. SMS requires either this `body` value, or `media_urls` attribute defined in the `sms` parameter of the notification.
                    # @param [Priority] priority 
                    # @param [String] ttl How long, in seconds, the notification is valid. Can be an integer between 0 and 2,419,200, which is 4 weeks, the default and the maximum supported time to live (TTL). Delivery should be attempted if the device is offline until the TTL elapses. Zero means that the notification delivery is attempted immediately, only once, and is not stored for future delivery. SMS does not support this property.
                    # @param [String] title The notification title. For FCM and GCM, this translates to the `data.twi_title` value. For APNS, this translates to the `aps.alert.title` value. SMS does not support this property. This field is not visible on iOS phones and tablets but appears on Apple Watch and Android devices.
                    # @param [String] sound The name of the sound to be played for the notification. For FCM and GCM, this Translates to `data.twi_sound`.  For APNS, this translates to `aps.sound`.  SMS does not support this property.
                    # @param [String] action The actions to display for the notification. For APNS, translates to the `aps.category` value. For GCM, translates to the `data.twi_action` value. For SMS, this parameter is not supported and is omitted from deliveries to those channels.
                    # @param [Object] data The custom key-value pairs of the notification's payload. For FCM and GCM, this value translates to `data` in the FCM and GCM payloads. FCM and GCM [reserve certain keys](https://firebase.google.com/docs/cloud-messaging/http-server-ref) that cannot be used in those channels. For APNS, attributes of `data` are inserted into the APNS payload as custom properties outside of the `aps` dictionary. In all channels, we reserve keys that start with `twi_` for future use. Custom keys that start with `twi_` are not allowed and are rejected as 400 Bad request with no delivery attempted. For SMS, this parameter is not supported and is omitted from deliveries to those channels.
                    # @param [Object] apn The APNS-specific payload that overrides corresponding attributes in the generic payload for APNS Bindings. This property maps to the APNS `Payload` item, therefore the `aps` key must be used to change standard attributes. Adds custom key-value pairs to the root of the dictionary. See the [APNS documentation](https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/CommunicatingwithAPNs.html) for more details. We reserve keys that start with `twi_` for future use. Custom keys that start with `twi_` are not allowed.
                    # @param [Object] gcm The GCM-specific payload that overrides corresponding attributes in the generic payload for GCM Bindings.  This property maps to the root JSON dictionary. See the [GCM documentation](https://firebase.google.com/docs/cloud-messaging/http-server-ref) for more details. Target parameters `to`, `registration_ids`, and `notification_key` are not allowed. We reserve keys that start with `twi_` for future use. Custom keys that start with `twi_` are not allowed. GCM also [reserves certain keys](https://firebase.google.com/docs/cloud-messaging/http-server-ref).
                    # @param [Object] sms The SMS-specific payload that overrides corresponding attributes in the generic payload for SMS Bindings.  Each attribute in this value maps to the corresponding `form` parameter of the Twilio [Message](https://www.twilio.com/docs/sms/quickstart) resource.  These parameters of the Message resource are supported in snake case format: `body`, `media_urls`, `status_callback`, and `max_price`.  The `status_callback` parameter overrides the corresponding parameter in the messaging service, if configured. The `media_urls` property expects a JSON array.
                    # @param [Object] facebook_messenger Deprecated.
                    # @param [Object] fcm The FCM-specific payload that overrides corresponding attributes in the generic payload for FCM Bindings. This property maps to the root JSON dictionary. See the [FCM documentation](https://firebase.google.com/docs/cloud-messaging/http-server-ref#downstream) for more details. Target parameters `to`, `registration_ids`, `condition`, and `notification_key` are not allowed in this parameter. We reserve keys that start with `twi_` for future use. Custom keys that start with `twi_` are not allowed. FCM also [reserves certain keys](https://firebase.google.com/docs/cloud-messaging/http-server-ref), which cannot be used in that channel.
                    # @param [Array[String]] segment The Segment resource is deprecated. Use the `tag` parameter, instead.
                    # @param [Object] alexa Deprecated.
                    # @param [Array[String]] to_binding The destination address specified as a JSON string.  Multiple `to_binding` parameters can be included but the total size of the request entity should not exceed 1MB. This is typically sufficient for 10,000 phone numbers.
                    # @param [String] delivery_callback_url URL to send webhooks.
                    # @param [Array[String]] identity The `identity` value that uniquely identifies the new resource's [User](https://www.twilio.com/docs/chat/rest/user-resource) within the [Service](https://www.twilio.com/docs/notify/api/service-resource). Delivery will be attempted only to Bindings with an Identity in this list. No more than 20 items are allowed in this list.
                    # @param [Array[String]] tag A tag that selects the Bindings to notify. Repeat this parameter to specify more than one tag, up to a total of 5 tags. The implicit tag `all` is available to notify all Bindings in a Service instance. Similarly, the implicit tags `apn`, `fcm`, `gcm`, `sms` and `facebook-messenger` are available to notify all Bindings in a specific channel.
                    # @return [NotificationInstance] Created NotificationInstance
                    def create(
                        body: :unset, 
                        priority: :unset, 
                        ttl: :unset, 
                        title: :unset, 
                        sound: :unset, 
                        action: :unset, 
                        data: :unset, 
                        apn: :unset, 
                        gcm: :unset, 
                        sms: :unset, 
                        facebook_messenger: :unset, 
                        fcm: :unset, 
                        segment: :unset, 
                        alexa: :unset, 
                        to_binding: :unset, 
                        delivery_callback_url: :unset, 
                        identity: :unset, 
                        tag: :unset
                    )

                        data = Twilio::Values.of({
                            'Body' => body,
                            'Priority' => priority,
                            'Ttl' => ttl,
                            'Title' => title,
                            'Sound' => sound,
                            'Action' => action,
                            'Data' => Twilio.serialize_object(data),
                            'Apn' => Twilio.serialize_object(apn),
                            'Gcm' => Twilio.serialize_object(gcm),
                            'Sms' => Twilio.serialize_object(sms),
                            'FacebookMessenger' => Twilio.serialize_object(facebook_messenger),
                            'Fcm' => Twilio.serialize_object(fcm),
                            'Segment' => Twilio.serialize_list(segment) { |e| e },
                            'Alexa' => Twilio.serialize_object(alexa),
                            'ToBinding' => Twilio.serialize_list(to_binding) { |e| e },
                            'DeliveryCallbackUrl' => delivery_callback_url,
                            'Identity' => Twilio.serialize_list(identity) { |e| e },
                            'Tag' => Twilio.serialize_list(tag) { |e| e },
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        NotificationInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Notify.V1.NotificationList>'
                    end
                end

                class NotificationPage < Page
                    ##
                    # Initialize the NotificationPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [NotificationPage] NotificationPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of NotificationInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [NotificationInstance] NotificationInstance
                    def get_instance(payload)
                        NotificationInstance.new(@version, payload, service_sid: @solution[:service_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Notify.V1.NotificationPage>'
                    end
                end
                class NotificationInstance < InstanceResource
                    ##
                    # Initialize the NotificationInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Notification
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [NotificationInstance] NotificationInstance
                    def initialize(version, payload , service_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'service_sid' => payload['service_sid'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'identities' => payload['identities'],
                            'tags' => payload['tags'],
                            'segments' => payload['segments'],
                            'priority' => payload['priority'],
                            'ttl' => payload['ttl'] == nil ? payload['ttl'] : payload['ttl'].to_i,
                            'title' => payload['title'],
                            'body' => payload['body'],
                            'sound' => payload['sound'],
                            'action' => payload['action'],
                            'data' => payload['data'],
                            'apn' => payload['apn'],
                            'gcm' => payload['gcm'],
                            'fcm' => payload['fcm'],
                            'sms' => payload['sms'],
                            'facebook_messenger' => payload['facebook_messenger'],
                            'alexa' => payload['alexa'],
                        }
                    end

                    
                    ##
                    # @return [String] The unique string that we created to identify the Notification resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Notification resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Service](https://www.twilio.com/docs/notify/api/service-resource) the resource is associated with.
                    def service_sid
                        @properties['service_sid']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Array<String>] The list of `identity` values of the Users to notify. We will attempt to deliver notifications only to Bindings with an identity in this list.
                    def identities
                        @properties['identities']
                    end
                    
                    ##
                    # @return [Array<String>] The tags that select the Bindings to notify. Notifications will be attempted only to Bindings that have all of the tags listed in this property.
                    def tags
                        @properties['tags']
                    end
                    
                    ##
                    # @return [Array<String>] The list of Segments to notify. The [Segment](https://www.twilio.com/docs/notify/api/segment-resource) resource is deprecated. Use the `tags` property, instead.
                    def segments
                        @properties['segments']
                    end
                    
                    ##
                    # @return [Priority] 
                    def priority
                        @properties['priority']
                    end
                    
                    ##
                    # @return [String] How long, in seconds, the notification is valid. Can be an integer between 0 and 2,419,200, which is 4 weeks, the default and the maximum supported time to live (TTL). Delivery should be attempted if the device is offline until the TTL elapses. Zero means that the notification delivery is attempted immediately, only once, and is not stored for future delivery. SMS does not support this property.
                    def ttl
                        @properties['ttl']
                    end
                    
                    ##
                    # @return [String] The notification title. For FCM and GCM, this translates to the `data.twi_title` value. For APNS, this translates to the `aps.alert.title` value. SMS does not support this property. This field is not visible on iOS phones and tablets but appears on Apple Watch and Android devices.
                    def title
                        @properties['title']
                    end
                    
                    ##
                    # @return [String] The notification text. For FCM and GCM, translates to `data.twi_body`. For APNS, translates to `aps.alert.body`. For SMS, translates to `body`. SMS requires either this `body` value, or `media_urls` attribute defined in the `sms` parameter of the notification.
                    def body
                        @properties['body']
                    end
                    
                    ##
                    # @return [String] The name of the sound to be played for the notification. For FCM and GCM, this Translates to `data.twi_sound`.  For APNS, this translates to `aps.sound`.  SMS does not support this property.
                    def sound
                        @properties['sound']
                    end
                    
                    ##
                    # @return [String] The actions to display for the notification. For APNS, translates to the `aps.category` value. For GCM, translates to the `data.twi_action` value. For SMS, this parameter is not supported and is omitted from deliveries to those channels.
                    def action
                        @properties['action']
                    end
                    
                    ##
                    # @return [Hash] The custom key-value pairs of the notification's payload. For FCM and GCM, this value translates to `data` in the FCM and GCM payloads. FCM and GCM [reserve certain keys](https://firebase.google.com/docs/cloud-messaging/http-server-ref) that cannot be used in those channels. For APNS, attributes of `data` are inserted into the APNS payload as custom properties outside of the `aps` dictionary. In all channels, we reserve keys that start with `twi_` for future use. Custom keys that start with `twi_` are not allowed and are rejected as 400 Bad request with no delivery attempted. For SMS, this parameter is not supported and is omitted from deliveries to those channels.
                    def data
                        @properties['data']
                    end
                    
                    ##
                    # @return [Hash] The APNS-specific payload that overrides corresponding attributes in the generic payload for APNS Bindings. This property maps to the APNS `Payload` item, therefore the `aps` key must be used to change standard attributes. Adds custom key-value pairs to the root of the dictionary. See the [APNS documentation](https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/CommunicatingwithAPNs.html) for more details. We reserve keys that start with `twi_` for future use. Custom keys that start with `twi_` are not allowed.
                    def apn
                        @properties['apn']
                    end
                    
                    ##
                    # @return [Hash] The GCM-specific payload that overrides corresponding attributes in the generic payload for GCM Bindings.  This property maps to the root JSON dictionary. Target parameters `to`, `registration_ids`, and `notification_key` are not allowed. We reserve keys that start with `twi_` for future use. Custom keys that start with `twi_` are not allowed.
                    def gcm
                        @properties['gcm']
                    end
                    
                    ##
                    # @return [Hash] The FCM-specific payload that overrides corresponding attributes in the generic payload for FCM Bindings. This property maps to the root JSON dictionary. See the [FCM documentation](https://firebase.google.com/docs/cloud-messaging/http-server-ref#downstream) for more details. Target parameters `to`, `registration_ids`, `condition`, and `notification_key` are not allowed in this parameter. We reserve keys that start with `twi_` for future use. Custom keys that start with `twi_` are not allowed. FCM also [reserves certain keys](https://firebase.google.com/docs/cloud-messaging/http-server-ref), which cannot be used in that channel.
                    def fcm
                        @properties['fcm']
                    end
                    
                    ##
                    # @return [Hash] The SMS-specific payload that overrides corresponding attributes in the generic payload for SMS Bindings.  Each attribute in this value maps to the corresponding `form` parameter of the Twilio [Message](https://www.twilio.com/docs/sms/api/message-resource) resource.  These parameters of the Message resource are supported in snake case format: `body`, `media_urls`, `status_callback`, and `max_price`.  The `status_callback` parameter overrides the corresponding parameter in the messaging service, if configured. The `media_urls` property expects a JSON array.
                    def sms
                        @properties['sms']
                    end
                    
                    ##
                    # @return [Hash] Deprecated.
                    def facebook_messenger
                        @properties['facebook_messenger']
                    end
                    
                    ##
                    # @return [Hash] Deprecated.
                    def alexa
                        @properties['alexa']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Notify.V1.NotificationInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Notify.V1.NotificationInstance>"
                    end
                end

             end
            end
        end
    end
end


