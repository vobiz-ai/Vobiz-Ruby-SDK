# frozen_string_literal: true

module Vobiz
  module ConferenceRecording
    module Types
      class StartConferenceRecordingRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :conference_name, -> { String }, optional: false, nullable: false

        field :file_format, -> { Vobiz::ConferenceRecording::Types::StartConferenceRecordingRequestFileFormat }, optional: true, nullable: false

        field :callback_url, -> { String }, optional: true, nullable: false
      end
    end
  end
end
