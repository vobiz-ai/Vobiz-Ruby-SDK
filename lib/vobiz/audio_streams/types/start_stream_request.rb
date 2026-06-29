# frozen_string_literal: true

module Vobiz
  module AudioStreams
    module Types
      class StartStreamRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :call_uuid, -> { String }, optional: false, nullable: false

        field :service_url, -> { String }, optional: false, nullable: false

        field :bidirectional, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :audio_track, -> { Vobiz::AudioStreams::Types::StartStreamRequestAudioTrack }, optional: true, nullable: false

        field :audio_format, -> { Vobiz::AudioStreams::Types::StartStreamRequestAudioFormat }, optional: true, nullable: false
      end
    end
  end
end
