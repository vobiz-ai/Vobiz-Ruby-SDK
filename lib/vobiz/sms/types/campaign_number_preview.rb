# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # One number attached to a campaign at the US 10DLC registry.
      class CampaignNumberPreview < Internal::Types::Model
        field :number_key, -> { String }, optional: true, nullable: false, api_name: "numberKey"

        field :number, -> { String }, optional: true, nullable: false

        field :country_code, -> { String }, optional: true, nullable: false, api_name: "countryCode"
      end
    end
  end
end
