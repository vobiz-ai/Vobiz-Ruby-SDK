# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # A labelled link shown on an RCS sender's info page, used for the privacy policy and terms of service.
      class SenderLink < Internal::Types::Model
        field :url, -> { String }, optional: true, nullable: false

        field :label, -> { String }, optional: true, nullable: false
      end
    end
  end
end
