# frozen_string_literal: true

module Vobiz
  module Types
    module KycVerificationResultStatus
      extend Vobiz::Internal::Types::Enum

      VERIFIED = "verified"
      FAILED = "failed"
      PENDING = "pending"
    end
  end
end
