# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # An estimate of what a message costs before you send it: how many segments the text splits into, and the price
      # per segment and in total.
      class CostPreview < Internal::Types::Model
        field :channel, -> { String }, optional: true, nullable: false

        field :segment_count, -> { Integer }, optional: true, nullable: false, api_name: "segmentCount"

        field :unit_cost, -> { Integer }, optional: true, nullable: false, api_name: "unitCost"

        field :total_cost, -> { Integer }, optional: true, nullable: false, api_name: "totalCost"

        field :currency, -> { String }, optional: true, nullable: false

        field :country, -> { String }, optional: true, nullable: false
      end
    end
  end
end
