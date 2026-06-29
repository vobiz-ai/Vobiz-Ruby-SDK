# frozen_string_literal: true

module Vobiz
  module LiveCalls
    module Types
      class GetQueuedCallResponse < Internal::Types::Model
        field :api_id, -> { String }, optional: false, nullable: false

        field :call_status, -> { String }, optional: false, nullable: false

        field :call_uuid, -> { String }, optional: false, nullable: false

        field :request_uuid, -> { String }, optional: false, nullable: false

        field :caller_name, -> { String }, optional: false, nullable: false

        field :direction, -> { String }, optional: false, nullable: false

        field :from, -> { String }, optional: false, nullable: false

        field :to, -> { String }, optional: false, nullable: false
      end
    end
  end
end
