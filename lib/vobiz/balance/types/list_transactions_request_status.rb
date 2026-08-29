# frozen_string_literal: true

module Vobiz
  module Balance
    module Types
      module ListTransactionsRequestStatus
        extend Vobiz::Internal::Types::Enum

        COMPLETED = "completed"
        PENDING = "pending"
        FAILED = "failed"
        CANCELLED = "cancelled"
      end
    end
  end
end
