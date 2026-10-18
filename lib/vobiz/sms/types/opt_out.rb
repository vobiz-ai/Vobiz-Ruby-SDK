# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # A phone number on your opt-out list for one channel. Vobiz blocks sends and broadcast deliveries to it on that
      # channel until you delete the entry.
      class OptOut < Internal::Types::Model
        field :id, -> { String }, optional: true, nullable: false

        field :account_id, -> { String }, optional: true, nullable: false, api_name: "accountId"

        field :phone_number, -> { String }, optional: true, nullable: false, api_name: "phoneNumber"

        field :channel, -> { String }, optional: true, nullable: false

        field :reason, -> { String }, optional: true, nullable: false

        field :source, -> { Vobiz::Sms::Types::OptOutSource }, optional: true, nullable: false

        field :synced_to_provider, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "syncedToProvider"

        field :created_at, -> { String }, optional: true, nullable: false, api_name: "createdAt"
      end
    end
  end
end
