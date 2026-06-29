# frozen_string_literal: true

module Vobiz
  module SubAccountKycTestMode
    module Types
      module MockSubaccountDigilockerVerifyRequestAccessRequestID
        extend Vobiz::Internal::Types::Enum

        MOCK_AR_SUCCESS = "MOCK_AR_SUCCESS"
        MOCK_AR_FAIL = "MOCK_AR_FAIL"
      end
    end
  end
end
