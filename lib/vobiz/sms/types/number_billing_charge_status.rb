# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      module NumberBillingChargeStatus
        extend Vobiz::Internal::Types::Enum

        PENDING = "pending"
        PAID = "paid"
        FAILED = "failed"
        REFUNDED = "refunded"
      end
    end
  end
end
