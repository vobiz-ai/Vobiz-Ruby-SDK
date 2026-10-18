# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      module BroadcastStatus
        extend Vobiz::Internal::Types::Enum

        DRAFT = "draft"
        SCHEDULED = "scheduled"
        RUNNING = "running"
        PAUSED = "paused"
        COMPLETED = "completed"
        CANCELLED = "cancelled"
        FAILED = "failed"
      end
    end
  end
end
