# frozen_string_literal: true

module Vobiz
  module Types
    module PartnerTransactionType
      extend Vobiz::Internal::Types::Enum

      RECHARGE = "recharge"
      DEBIT = "debit"
      ADJUSTMENT = "adjustment"
      REFUND = "refund"
    end
  end
end
