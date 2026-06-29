# frozen_string_literal: true

module Vobiz
  module SpeakText
    module Types
      class SpeakTextCallRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :call_uuid, -> { String }, optional: false, nullable: false

        field :text, -> { String }, optional: false, nullable: false

        field :voice, -> { String }, optional: true, nullable: false

        field :language, -> { String }, optional: true, nullable: false

        field :legs, -> { Vobiz::SpeakText::Types::SpeakTextCallRequestLegs }, optional: true, nullable: false
      end
    end
  end
end
