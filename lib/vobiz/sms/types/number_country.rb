# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # A country with messaging numbers in stock.
      class NumberCountry < Internal::Types::Model
        field :country, -> { String }, optional: true, nullable: false

        field :name, -> { String }, optional: true, nullable: false

        field :types, -> { Internal::Types::Array[String] }, optional: true, nullable: false

        field :capabilities, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      end
    end
  end
end
