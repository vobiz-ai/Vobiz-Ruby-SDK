# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class ListCustomerAccountsResponseAccountsItemPricingTier < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :name, -> { String }, optional: false, nullable: false

        field :currency, -> { String }, optional: false, nullable: false

        field :rate_per_minute, -> { Integer }, optional: false, nullable: false

        field :streaming_rate_per_minute, -> { Integer }, optional: false, nullable: false

        field :recording_rate_per_minute, -> { Integer }, optional: false, nullable: false

        field :whatsapp_voice_rate, -> { Integer }, optional: false, nullable: false

        field :transcription_rate_per_minute, -> { Integer }, optional: false, nullable: false

        field :pii_redaction_rate_per_minute, -> { Integer }, optional: false, nullable: false

        field :charge_non_connected_calls, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :non_connected_call_fee, -> { Integer }, optional: false, nullable: false

        field :did_release_fee, -> { Integer }, optional: false, nullable: false

        field :is_active, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :is_default, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :partner_id, -> { Object }, optional: false, nullable: true
      end
    end
  end
end
