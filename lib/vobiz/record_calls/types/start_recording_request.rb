# frozen_string_literal: true

module Vobiz
  module RecordCalls
    module Types
      class StartRecordingRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :call_uuid, -> { String }, optional: false, nullable: false

        field :time_limit, -> { Integer }, optional: true, nullable: false

        field :file_format, -> { Vobiz::RecordCalls::Types::StartRecordingRequestFileFormat }, optional: true, nullable: false

        field :transcription_type, -> { String }, optional: true, nullable: false

        field :callback_url, -> { String }, optional: true, nullable: false

        field :record_channel_type, -> { Vobiz::RecordCalls::Types::StartRecordingRequestRecordChannelType }, optional: true, nullable: false
      end
    end
  end
end
