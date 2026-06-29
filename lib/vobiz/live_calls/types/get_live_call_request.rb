# frozen_string_literal: true

module Vobiz
  module LiveCalls
    module Types
      class GetLiveCallRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :call_uuid, -> { String }, optional: false, nullable: false

        field :status, -> { Vobiz::LiveCalls::Types::GetLiveCallRequestStatus }, optional: false, nullable: false
      end
    end
  end
end
