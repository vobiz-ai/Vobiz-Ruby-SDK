# frozen_string_literal: true

module Vobiz
  module PhoneNumbers
    module Types
      class UnassignDidFromSubaccountRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :e164, -> { String }, optional: false, nullable: false

        field :force, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
