# frozen_string_literal: true

module Vobiz
  module LiveCalls
    module Types
      module GetQueuedCallRequestStatus
        extend Vobiz::Internal::Types::Enum

        LIVE = "live"
        QUEUED = "queued"
      end
    end
  end
end
