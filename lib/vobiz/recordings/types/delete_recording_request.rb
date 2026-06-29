# frozen_string_literal: true

module Vobiz
  module Recordings
    module Types
      class DeleteRecordingRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :recording_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
