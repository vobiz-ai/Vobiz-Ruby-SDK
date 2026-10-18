# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      module SmsNumberRegistrationStatus
        extend Vobiz::Internal::Types::Enum

        NOT_REGISTERED = "not_registered"
        DRAFT = "draft"
        PENDING = "pending"
        APPROVED = "approved"
        REJECTED = "rejected"
        NOT_REQUIRED = "not_required"
      end
    end
  end
end
