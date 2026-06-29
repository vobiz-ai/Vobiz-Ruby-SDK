# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      module ListCustomerTransactionsRequestTransactionType
        extend Vobiz::Internal::Types::Enum

        RECHARGE = "recharge"
        DEBIT = "debit"
        REFUND = "refund"
        TRANSFER = "transfer"
      end
    end
  end
end
