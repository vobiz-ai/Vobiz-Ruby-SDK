# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # Countries where you can buy messaging numbers, from a snapshot of the inventory.
      class NumberCountries < Internal::Types::Model
        field :countries, -> { Internal::Types::Array[Vobiz::Sms::Types::NumberCountry] }, optional: true, nullable: false

        field :updated_at, -> { String }, optional: true, nullable: false, api_name: "updatedAt"

        field :ready, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
