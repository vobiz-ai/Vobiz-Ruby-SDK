# frozen_string_literal: true

module Vobiz
  module PhoneNumbers
    module Types
      class UnrentNumberRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :e164, -> { String }, optional: false, nullable: false

        field :immediate, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
