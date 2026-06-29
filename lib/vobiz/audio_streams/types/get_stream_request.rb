# frozen_string_literal: true

module Vobiz
  module AudioStreams
    module Types
      class GetStreamRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :call_uuid, -> { String }, optional: false, nullable: false

        field :stream_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
