# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # A number in the inventory that you can buy, with its type, capabilities and price.
      class AvailableNumber < Internal::Types::Model
        field :e164, -> { String }, optional: true, nullable: false

        field :number_key, -> { String }, optional: true, nullable: false, api_name: "numberKey"

        field :country_code, -> { String }, optional: true, nullable: false, api_name: "countryCode"

        field :type, -> { String }, optional: true, nullable: false

        field :capabilities, -> { Internal::Types::Array[String] }, optional: true, nullable: false

        field :network, -> { String }, optional: true, nullable: false

        field :setup_price, -> { Integer }, optional: true, nullable: false, api_name: "setupPrice"

        field :monthly_price, -> { Integer }, optional: true, nullable: false, api_name: "monthlyPrice"

        field :currency, -> { String }, optional: true, nullable: false

        field :provider_requires_documents, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "providerRequiresDocuments"
      end
    end
  end
end
