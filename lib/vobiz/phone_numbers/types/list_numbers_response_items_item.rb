# frozen_string_literal: true

module Vobiz
  module PhoneNumbers
    module Types
      class ListNumbersResponseItemsItem < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :account_id, -> { String }, optional: false, nullable: false

        field :e164, -> { String }, optional: false, nullable: false

        field :country, -> { String }, optional: false, nullable: false

        field :region, -> { String }, optional: false, nullable: false

        field :capabilities, -> { Vobiz::PhoneNumbers::Types::ListNumbersResponseItemsItemCapabilities }, optional: false, nullable: false

        field :status, -> { String }, optional: false, nullable: false

        field :provider, -> { String }, optional: false, nullable: false

        field :setup_fee, -> { Integer }, optional: false, nullable: false

        field :monthly_fee, -> { Integer }, optional: false, nullable: false

        field :currency, -> { String }, optional: false, nullable: false

        field :application_id, -> { String }, optional: true, nullable: false

        field :voice_enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :tags, -> { Internal::Types::Array[String] }, optional: false, nullable: false

        field :purchased_at, -> { String }, optional: false, nullable: false

        field :is_blocked, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :created_at, -> { String }, optional: false, nullable: false

        field :updated_at, -> { String }, optional: false, nullable: false

        field :is_trial_number, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :last_billing_date, -> { String }, optional: true, nullable: false

        field :next_billing_date, -> { String }, optional: true, nullable: false

        field :minimum_commitment_months, -> { Integer }, optional: false, nullable: false

        field :aadhaar_verification_required, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :aadhaar_verified, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :source, -> { String }, optional: false, nullable: false

        field :released_at, -> { String }, optional: true, nullable: false

        field :trunk_group_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
