# frozen_string_literal: true

module Vobiz
  module Types
    class ChannelPricingPreview < Internal::Types::Model
      field :resource_type, -> { Vobiz::Types::CapacityResourceType }, optional: false, nullable: false

      field :quantity, -> { Integer }, optional: false, nullable: false

      field :monthly_cost, -> { String }, optional: false, nullable: false

      field :currency, -> { String }, optional: false, nullable: false

      field :breakdown, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: false, nullable: false
    end
  end
end
