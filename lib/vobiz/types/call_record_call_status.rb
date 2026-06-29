# frozen_string_literal: true

module Vobiz
  module Types
    module CallRecordCallStatus
      extend Vobiz::Internal::Types::Enum

      ANSWERED = "answered"
      BUSY = "busy"
      FAILED = "failed"
      NO_ANSWER = "no-answer"
      CANCELLED = "cancelled"
    end
  end
end
