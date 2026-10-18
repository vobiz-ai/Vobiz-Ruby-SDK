# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # Numbers to add to, remove from or re-register on a campaign. Provide `numbers`, `numberKeys`, or both; if both
      # are empty the request returns `400` with `invalid request: numbers or numberKeys is required`.
      class CampaignNumbersRequest < Internal::Types::Model
        field :numbers, -> { Internal::Types::Array[String] }, optional: true, nullable: false

        field :number_keys, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "numberKeys"
      end
    end
  end
end
