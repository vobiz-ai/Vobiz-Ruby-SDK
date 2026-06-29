# frozen_string_literal: true

module Vobiz
  module PhoneNumbers
    module Types
      class PurchaseFromInventoryRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :e164, -> { String }, optional: false, nullable: false

        field :currency, -> { String }, optional: true, nullable: false
      end
    end
  end
end
