##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Routes < Domain
      class V2 < Version
        class TrunkList < ListResource
          ##
          # Initialize the TrunkList
          # @param [Version] version Version that contains the resource
          # @return [TrunkList] TrunkList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Routes.V2.TrunkList>'
          end
        end

        class TrunkPage < Page
          ##
          # Initialize the TrunkPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [TrunkPage] TrunkPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of TrunkInstance
          # @param [Hash] payload Payload response from the API
          # @return [TrunkInstance] TrunkInstance
          def get_instance(payload)
            TrunkInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Routes.V2.TrunkPage>'
          end
        end

        class TrunkContext < InstanceContext
          ##
          # Initialize the TrunkContext
          # @param [Version] version Version that contains the resource
          # @param [String] sip_trunk_domain The absolute URL of the SIP Trunk
          # @return [TrunkContext] TrunkContext
          def initialize(version, sip_trunk_domain)
            super(version)

            # Path Solution
            @solution = {sip_trunk_domain: sip_trunk_domain, }
            @uri = "/Trunks/#{@solution[:sip_trunk_domain]}"
          end

          ##
          # Create the TrunkInstance
          # @param [String] voice_region The Inbound Processing Region used for this SIP
          #   Trunk for voice
          # @param [String] friendly_name A human readable description of this resource, up
          #   to 64 characters.
          # @return [TrunkInstance] Created TrunkInstance
          def create(voice_region: :unset, friendly_name: :unset)
            data = Twilio::Values.of({'VoiceRegion' => voice_region, 'FriendlyName' => friendly_name, })

            payload = @version.create('POST', @uri, data: data)

            TrunkInstance.new(@version, payload, sip_trunk_domain: @solution[:sip_trunk_domain], )
          end

          ##
          # Update the TrunkInstance
          # @param [String] voice_region The Inbound Processing Region used for this SIP
          #   Trunk for voice
          # @param [String] friendly_name A human readable description of this resource, up
          #   to 64 characters.
          # @return [TrunkInstance] Updated TrunkInstance
          def update(voice_region: :unset, friendly_name: :unset)
            data = Twilio::Values.of({'VoiceRegion' => voice_region, 'FriendlyName' => friendly_name, })

            payload = @version.update('POST', @uri, data: data)

            TrunkInstance.new(@version, payload, sip_trunk_domain: @solution[:sip_trunk_domain], )
          end

          ##
          # Fetch the TrunkInstance
          # @return [TrunkInstance] Fetched TrunkInstance
          def fetch
            payload = @version.fetch('GET', @uri)

            TrunkInstance.new(@version, payload, sip_trunk_domain: @solution[:sip_trunk_domain], )
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Routes.V2.TrunkContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Routes.V2.TrunkContext #{context}>"
          end
        end

        class TrunkInstance < InstanceResource
          ##
          # Initialize the TrunkInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sip_trunk_domain The absolute URL of the SIP Trunk
          # @return [TrunkInstance] TrunkInstance
          def initialize(version, payload, sip_trunk_domain: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sip_trunk_domain' => payload['sip_trunk_domain'],
                'url' => payload['url'],
                'sid' => payload['sid'],
                'account_sid' => payload['account_sid'],
                'friendly_name' => payload['friendly_name'],
                'voice_region' => payload['voice_region'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
            }

            # Context
            @instance_context = nil
            @params = {'sip_trunk_domain' => sip_trunk_domain || @properties['sip_trunk_domain'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [TrunkContext] TrunkContext for this TrunkInstance
          def context
            unless @instance_context
              @instance_context = TrunkContext.new(@version, @params['sip_trunk_domain'], )
            end
            @instance_context
          end

          ##
          # @return [String] The SIP Trunk
          def sip_trunk_domain
            @properties['sip_trunk_domain']
          end

          ##
          # @return [String] The absolute URL of the resource
          def url
            @properties['url']
          end

          ##
          # @return [String] A string that uniquely identifies the Inbound Processing Region assignments for this SIP Trunk.
          def sid
            @properties['sid']
          end

          ##
          # @return [String] Account Sid.
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] A human readable description of the Inbound Processing Region assignments for this SIP Trunk.
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [String] The Inbound Processing Region used for this SIP Trunk for voice.
          def voice_region
            @properties['voice_region']
          end

          ##
          # @return [Time] The date that this SIP Trunk was assigned an Inbound Processing Region.
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The date that the Inbound Processing Region was updated for this SIP Trunk.
          def date_updated
            @properties['date_updated']
          end

          ##
          # Create the TrunkInstance
          # @param [String] voice_region The Inbound Processing Region used for this SIP
          #   Trunk for voice
          # @param [String] friendly_name A human readable description of this resource, up
          #   to 64 characters.
          # @return [TrunkInstance] Created TrunkInstance
          def create(voice_region: :unset, friendly_name: :unset)
            context.create(voice_region: voice_region, friendly_name: friendly_name, )
          end

          ##
          # Update the TrunkInstance
          # @param [String] voice_region The Inbound Processing Region used for this SIP
          #   Trunk for voice
          # @param [String] friendly_name A human readable description of this resource, up
          #   to 64 characters.
          # @return [TrunkInstance] Updated TrunkInstance
          def update(voice_region: :unset, friendly_name: :unset)
            context.update(voice_region: voice_region, friendly_name: friendly_name, )
          end

          ##
          # Fetch the TrunkInstance
          # @return [TrunkInstance] Fetched TrunkInstance
          def fetch
            context.fetch
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Routes.V2.TrunkInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Routes.V2.TrunkInstance #{values}>"
          end
        end
      end
    end
  end
end