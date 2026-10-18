# frozen_string_literal: true

module Vobiz
  module Sms
    class Client
      # @param client [Vobiz::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Vobiz::Messages::Client]
      def messages
        @messages ||= Vobiz::Sms::Messages::Client.new(client: @client)
      end

      # @return [Vobiz::Numbers::Client]
      def numbers
        @numbers ||= Vobiz::Sms::Numbers::Client.new(client: @client)
      end

      # @return [Vobiz::Coverage::Client]
      def coverage
        @coverage ||= Vobiz::Sms::Coverage::Client.new(client: @client)
      end

      # @return [Vobiz::Conversations::Client]
      def conversations
        @conversations ||= Vobiz::Sms::Conversations::Client.new(client: @client)
      end

      # @return [Vobiz::OptOuts::Client]
      def opt_outs
        @opt_outs ||= Vobiz::Sms::OptOuts::Client.new(client: @client)
      end

      # @return [Vobiz::Webhooks::Client]
      def webhooks
        @webhooks ||= Vobiz::Sms::Webhooks::Client.new(client: @client)
      end

      # @return [Vobiz::Broadcasts::Client]
      def broadcasts
        @broadcasts ||= Vobiz::Sms::Broadcasts::Client.new(client: @client)
      end

      # @return [Vobiz::RcsSenders::Client]
      def rcs_senders
        @rcs_senders ||= Vobiz::Sms::RcsSenders::Client.new(client: @client)
      end

      # @return [Vobiz::Brands::Client]
      def brands
        @brands ||= Vobiz::Sms::Brands::Client.new(client: @client)
      end

      # @return [Vobiz::Campaigns::Client]
      def campaigns
        @campaigns ||= Vobiz::Sms::Campaigns::Client.new(client: @client)
      end
    end
  end
end
