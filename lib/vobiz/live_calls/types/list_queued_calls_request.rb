# frozen_string_literal: true

module Vobiz
  module LiveCalls
    module Types
      class ListQueuedCallsRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :status, -> { Vobiz::LiveCalls::Types::ListQueuedCallsRequestStatus }, optional: false, nullable: false
      end
    end
  end
end
