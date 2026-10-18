# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # One page of messages from `GET /messages`, with the total number of matches so you can page through the rest.
      class MessageList < Internal::Types::Model
        field :messages, -> { Internal::Types::Array[Vobiz::Sms::Types::Message] }, optional: true, nullable: false

        field :total, -> { Integer }, optional: true, nullable: false

        field :limit, -> { Integer }, optional: true, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
