# frozen_string_literal: true

module Vobiz
  module Account
    module Types
      class PreviewChannelPricingRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :resource_type, -> { Vobiz::Types::CapacityResourceType }, optional: false, nullable: false

        field :quantity, -> { Integer }, optional: false, nullable: false
      end
    end
  end
end
