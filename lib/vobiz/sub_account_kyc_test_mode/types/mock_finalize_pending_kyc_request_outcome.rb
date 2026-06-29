# frozen_string_literal: true

module Vobiz
  module SubAccountKycTestMode
    module Types
      module MockFinalizePendingKycRequestOutcome
        extend Vobiz::Internal::Types::Enum

        VERIFIED = "verified"
        FAILED = "failed"
      end
    end
  end
end
