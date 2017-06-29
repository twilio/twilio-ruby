##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Accounts < Domain
      class V1 < Version
        class CredentialList < ListResource
          ##
          # Initialize the CredentialList
          # @param [Version] version Version that contains the resource
          # @return [CredentialList] CredentialList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}

            # Components
            @public_key = nil
          end

          ##
          # Access the public_key
          # @param [String] sid The Credential Sid that uniquely identifies the Credential
          #   to fetch
          # @return [PublicKeyList] if a(n) PublicKeyList object was created.
          # @return [PublicKeyContext] if a(n) PublicKeyContext object was created.
          def public_key(sid=:unset)
            if sid.nil?
              raise ArgumentError, 'sid cannot be nil'
            end

            if sid != :unset
              return PublicKeyContext.new(
                  @version,
                  sid,
              )
            end

              @public_key ||= PublicKeyList.new(
                  @version,
              )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Accounts.V1.CredentialList>'
          end
        end

        class CredentialPage < Page
          ##
          # Initialize the CredentialPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [CredentialPage] CredentialPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of CredentialInstance
          # @param [Hash] payload Payload response from the API
          # @return [CredentialInstance] CredentialInstance
          def get_instance(payload)
            CredentialInstance.new(
                @version,
                payload,
            )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Accounts.V1.CredentialPage>'
          end
        end

        class CredentialInstance < InstanceResource
          ##
          # Initialize the CredentialInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @return [CredentialInstance] CredentialInstance
          def initialize(version, payload)
            super(version)
          end

          ##
          # Provide a user friendly representation
          def to_s
            "<Twilio.Accounts.V1.CredentialInstance>"
          end
        end
      end
    end
  end
end