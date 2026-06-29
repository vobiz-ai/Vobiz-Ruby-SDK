# frozen_string_literal: true

module Vobiz
  module Types
    module SubAccountKycStatusVerificationsValue
      extend Vobiz::Internal::Types::Enum

      NOT_STARTED = "not_started"
      PENDING = "pending"
      VERIFIED = "verified"
      FAILED = "failed"
    end
  end
end
