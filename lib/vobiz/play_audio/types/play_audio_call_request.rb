# frozen_string_literal: true

module Vobiz
  module PlayAudio
    module Types
      class PlayAudioCallRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :call_uuid, -> { String }, optional: false, nullable: false

        field :urls, -> { String }, optional: false, nullable: false

        field :legs, -> { Vobiz::PlayAudio::Types::PlayAudioCallRequestLegs }, optional: true, nullable: false

        field :loop, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
