# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      module BrandRegistrationStatus
        extend Vobiz::Internal::Types::Enum

        ACTIVE = "ACTIVE"
        PENDING = "PENDING"
        PENDING2FA = "PENDING_2FA"
        PENDING_APPEAL = "PENDING_APPEAL"
        REJECTED = "REJECTED"
      end
    end
  end
end
