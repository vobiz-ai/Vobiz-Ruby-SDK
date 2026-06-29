# frozen_string_literal: true

module Vobiz
  module Account
    module Types
      class RetrieveAccountResponsePricingTier < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :name, -> { String }, optional: false, nullable: false

        field :description, -> { String }, optional: false, nullable: false

        field :currency, -> { String }, optional: false, nullable: false

        field :rate_per_minute, -> { Integer }, optional: false, nullable: false

        field :billing_increment_seconds, -> { Integer }, optional: false, nullable: false

        field :minimum_duration_seconds, -> { Integer }, optional: false, nullable: false

        field :is_active, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :is_default, -> { Internal::Types::Boolean }, optional: false, nullable: false
      end
    end
  end
end
