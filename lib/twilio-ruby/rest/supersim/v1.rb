##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Supersim
      class V1 < Version
        ##
        # Initialize the V1 version of Supersim
        def initialize(domain)
          super
          @version = 'v1'
          @commands = nil
          @fleets = nil
          @networks = nil
          @network_access_profiles = nil
          @sims = nil
          @usage_records = nil
        end

        ##
        # @param [String] sid The SID of the Command resource to fetch.
        # @return [Twilio::REST::Supersim::V1::CommandContext] if sid was passed.
        # @return [Twilio::REST::Supersim::V1::CommandList]
        def commands(sid=:unset)
          if sid.nil?
              raise ArgumentError, 'sid cannot be nil'
          end
          if sid == :unset
              @commands ||= CommandList.new self
          else
              CommandContext.new(self, sid)
          end
        end

        ##
        # @param [String] sid The SID of the Fleet resource to fetch.
        # @return [Twilio::REST::Supersim::V1::FleetContext] if sid was passed.
        # @return [Twilio::REST::Supersim::V1::FleetList]
        def fleets(sid=:unset)
          if sid.nil?
              raise ArgumentError, 'sid cannot be nil'
          end
          if sid == :unset
              @fleets ||= FleetList.new self
          else
              FleetContext.new(self, sid)
          end
        end

        ##
        # @param [String] sid The SID of the Network resource to fetch.
        # @return [Twilio::REST::Supersim::V1::NetworkContext] if sid was passed.
        # @return [Twilio::REST::Supersim::V1::NetworkList]
        def networks(sid=:unset)
          if sid.nil?
              raise ArgumentError, 'sid cannot be nil'
          end
          if sid == :unset
              @networks ||= NetworkList.new self
          else
              NetworkContext.new(self, sid)
          end
        end

        ##
        # @param [String] sid The SID of the Network Access Profile resource to fetch.
        # @return [Twilio::REST::Supersim::V1::NetworkAccessProfileContext] if sid was passed.
        # @return [Twilio::REST::Supersim::V1::NetworkAccessProfileList]
        def network_access_profiles(sid=:unset)
          if sid.nil?
              raise ArgumentError, 'sid cannot be nil'
          end
          if sid == :unset
              @network_access_profiles ||= NetworkAccessProfileList.new self
          else
              NetworkAccessProfileContext.new(self, sid)
          end
        end

        ##
        # @param [String] sid The SID of the Sim resource to fetch.
        # @return [Twilio::REST::Supersim::V1::SimContext] if sid was passed.
        # @return [Twilio::REST::Supersim::V1::SimList]
        def sims(sid=:unset)
          if sid.nil?
              raise ArgumentError, 'sid cannot be nil'
          end
          if sid == :unset
              @sims ||= SimList.new self
          else
              SimContext.new(self, sid)
          end
        end

        ##
        # @return [Twilio::REST::Supersim::V1::UsageRecordContext]
        def usage_records
          @usage_records ||= UsageRecordList.new self
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Twilio::REST::Supersim::V1>'
        end
      end
    end
  end
end