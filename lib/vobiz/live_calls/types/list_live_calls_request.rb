# frozen_string_literal: true

module Vobiz
  module LiveCalls
    module Types
      class ListLiveCallsRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :status, -> { Vobiz::LiveCalls::Types::ListLiveCallsRequestStatus }, optional: false, nullable: false
      end
    end
  end
end
