# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # A row that was rejected during a recipient upload and not stored.
      class InvalidRecipient < Internal::Types::Model
        field :row, -> { Integer }, optional: true, nullable: false

        field :value, -> { String }, optional: true, nullable: false

        field :reason, -> { Vobiz::Sms::Types::InvalidRecipientReason }, optional: true, nullable: false
      end
    end
  end
end
