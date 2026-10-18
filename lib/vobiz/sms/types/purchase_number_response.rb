# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # The result of a successful purchase: the billing record and the routing record.
      class PurchaseNumberResponse < Internal::Types::Model
        field :purchase, -> { Vobiz::Sms::Types::NumberPurchase }, optional: true, nullable: false

        field :number, -> { Vobiz::Sms::Types::NumberRouting }, optional: true, nullable: false
      end
    end
  end
end
