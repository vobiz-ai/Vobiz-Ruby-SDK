# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # The routing record that connects a purchased number to your account for messaging.
      class NumberRouting < Internal::Types::Model
        field :id, -> { Integer }, optional: true, nullable: false

        field :e164, -> { String }, optional: true, nullable: false

        field :provider, -> { String }, optional: true, nullable: false

        field :channel_capabilities, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "channelCapabilities"

        field :account_id, -> { String }, optional: true, nullable: false, api_name: "accountId"

        field :country_code, -> { String }, optional: true, nullable: false, api_name: "countryCode"

        field :created_at, -> { String }, optional: true, nullable: false, api_name: "createdAt"
      end
    end
  end
end
