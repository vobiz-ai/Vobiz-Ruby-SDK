# frozen_string_literal: true

module Vobiz
  module AudioStreams
    module Types
      module StartStreamRequestAudioFormat
        extend Vobiz::Internal::Types::Enum

        PCM = "pcm"
        MULAW = "mulaw"
      end
    end
  end
end
