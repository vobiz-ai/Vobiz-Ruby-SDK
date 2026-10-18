# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      module WebhookEvent
        extend Vobiz::Internal::Types::Enum

        MESSAGE_STATUS = "message.status"
        MESSAGE_DELIVERED = "message.delivered"
        MESSAGE_FAILED = "message.failed"
        MESSAGE_RECEIVED = "message.received"
        BROADCAST_UPDATED = "broadcast.updated"
      end
    end
  end
end
