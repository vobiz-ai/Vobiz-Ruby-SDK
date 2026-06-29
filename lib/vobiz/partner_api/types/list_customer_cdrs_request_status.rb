# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      module ListCustomerCdrsRequestStatus
        extend Vobiz::Internal::Types::Enum

        ANSWERED = "answered"
        FAILED = "failed"
        BUSY = "busy"
        NO_ANSWER = "no_answer"
      end
    end
  end
end
