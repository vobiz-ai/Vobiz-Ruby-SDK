# frozen_string_literal: true

module Vobiz
  module SubAccounts
    module Types
      module CreateSubaccountRequestBusinessType
        extend Vobiz::Internal::Types::Enum

        INDIVIDUAL = "individual"
        PROPRIETORSHIP = "proprietorship"
        PRIVATE_LIMITED = "private_limited"
        LLP = "llp"
        PARTNERSHIP = "partnership"
        PUBLIC_LIMITED = "public_limited"
        TRUST = "trust"
        SOCIETY = "society"
        HUF = "huf"
        GOVERNMENT = "government"
      end
    end
  end
end
