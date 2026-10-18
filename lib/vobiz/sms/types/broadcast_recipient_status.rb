# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      module BroadcastRecipientStatus
        extend Vobiz::Internal::Types::Enum

        PENDING = "pending"
        SENDING = "sending"
        SENT = "sent"
        DELIVERED = "delivered"
        FAILED = "failed"
        OPTED_OUT = "opted_out"
        SKIPPED = "skipped"
      end
    end
  end
end
