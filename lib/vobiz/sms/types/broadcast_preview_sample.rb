# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # The template rendered for one recipient, with the encoding and segment count it will be sent with.
      class BroadcastPreviewSample < Internal::Types::Model
        field :to, -> { String }, optional: true, nullable: false

        field :text, -> { String }, optional: true, nullable: false

        field :segments, -> { Integer }, optional: true, nullable: false

        field :encoding, -> { Vobiz::Sms::Types::BroadcastPreviewSampleEncoding }, optional: true, nullable: false
      end
    end
  end
end
