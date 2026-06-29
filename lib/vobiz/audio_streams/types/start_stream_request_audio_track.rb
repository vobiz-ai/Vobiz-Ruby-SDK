# frozen_string_literal: true

module Vobiz
  module AudioStreams
    module Types
      module StartStreamRequestAudioTrack
        extend Vobiz::Internal::Types::Enum

        INBOUND = "inbound"
        OUTBOUND = "outbound"
        BOTH = "both"
      end
    end
  end
end
