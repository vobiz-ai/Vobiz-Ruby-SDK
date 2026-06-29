# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      module ListKycSessionsRequestStatus
        extend Vobiz::Internal::Types::Enum

        EMAIL_SENT = "email_sent"
        LINK_READY = "link_ready"
        OPENED = "opened"
        IN_PROGRESS = "in_progress"
        KYC_COMPLETED = "kyc_completed"
        REVOKED = "revoked"
      end
    end
  end
end
