# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      module NumberPurchaseStatus
        extend Vobiz::Internal::Types::Enum

        PENDING = "pending"
        DEBITED = "debited"
        PURCHASED = "purchased"
        PAST_DUE = "past_due"
        FAILED = "failed"
        REFUNDED = "refunded"
        RELEASED = "released"
      end
    end
  end
end
