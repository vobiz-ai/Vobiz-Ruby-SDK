# frozen_string_literal: true

module Vobiz
  module LiveCalls
    module Types
      class GetLiveCallResponse < Internal::Types::Model
        field :api_id, -> { String }, optional: false, nullable: false

        field :call_status, -> { String }, optional: false, nullable: false

        field :call_uuid, -> { String }, optional: false, nullable: false

        field :caller_name, -> { String }, optional: false, nullable: false

        field :direction, -> { String }, optional: false, nullable: false

        field :from, -> { String }, optional: false, nullable: false

        field :request_uuid, -> { String }, optional: false, nullable: false

        field :session_start, -> { String }, optional: false, nullable: false

        field :stir_attestation, -> { String }, optional: false, nullable: false

        field :stir_verification, -> { String }, optional: false, nullable: false

        field :to, -> { String }, optional: false, nullable: false
      end
    end
  end
end
