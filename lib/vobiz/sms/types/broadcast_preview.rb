# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # The template rendered for the first pending recipients, with the information you need to check a broadcast
      # before launching it.
      class BroadcastPreview < Internal::Types::Model
        field :samples, -> { Internal::Types::Array[Vobiz::Sms::Types::BroadcastPreviewSample] }, optional: true, nullable: false

        field :missing_variables, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "missingVariables"

        field :estimated_segments, -> { Integer }, optional: true, nullable: false, api_name: "estimatedSegments"
      end
    end
  end
end
