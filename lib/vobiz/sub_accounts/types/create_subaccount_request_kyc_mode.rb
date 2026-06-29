# frozen_string_literal: true

module Vobiz
  module SubAccounts
    module Types
      module CreateSubaccountRequestKycMode
        extend Vobiz::Internal::Types::Enum

        PERSONAL_USE = "personal_use"
        CUSTOMER_USE = "customer_use"
      end
    end
  end
end
