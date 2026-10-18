# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # One page of inventory search results.
      class AvailableNumbersResponse < Internal::Types::Model
        field :numbers, -> { Internal::Types::Array[Vobiz::Sms::Types::AvailableNumber] }, optional: true, nullable: false

        field :page, -> { Integer }, optional: true, nullable: false

        field :limit, -> { Integer }, optional: true, nullable: false

        field :has_more, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "hasMore"

        field :hint, -> { String }, optional: true, nullable: false
      end
    end
  end
end
