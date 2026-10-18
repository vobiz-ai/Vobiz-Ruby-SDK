# frozen_string_literal: true

module Vobiz
  module Sms
    module Messages
      module Types
        module ListMessagesRequestStatus
          extend Vobiz::Internal::Types::Enum

          SCHEDULED = "scheduled"
          SENT = "sent"
          DELIVERED = "delivered"
          FAILED = "failed"
          RECEIVED = "received"
          UNKNOWN = "unknown"
        end
      end
    end
  end
end
