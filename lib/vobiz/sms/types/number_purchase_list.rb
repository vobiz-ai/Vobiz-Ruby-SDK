# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # The numbers you have bought, with their billing history.
      class NumberPurchaseList < Internal::Types::Model
        field :purchases, -> { Internal::Types::Array[Vobiz::Sms::Types::NumberPurchase] }, optional: true, nullable: false
      end
    end
  end
end
