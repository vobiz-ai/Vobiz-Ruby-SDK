# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      module BrandBrandType
        extend Vobiz::Internal::Types::Enum

        TENDLC_PRIVATE_COMPANY = "TENDLC_PRIVATE_COMPANY"
        TENDLC_PUBLIC_COMPANY = "TENDLC_PUBLIC_COMPANY"
        TENDLC_NON_PROFIT = "TENDLC_NON_PROFIT"
        TENDLC_GOVERNMENT = "TENDLC_GOVERNMENT"
        TOLL_FREE_NUMBER = "TOLL_FREE_NUMBER"
      end
    end
  end
end
