# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # One recipient of a broadcast: the normalised number, the variables from its upload row and the state of its
      # message.
      class BroadcastRecipient < Internal::Types::Model
        field :id, -> { Integer }, optional: true, nullable: false

        field :row, -> { Integer }, optional: true, nullable: false

        field :to, -> { String }, optional: true, nullable: false

        field :variables, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false

        field :status, -> { Vobiz::Sms::Types::BroadcastRecipientStatus }, optional: true, nullable: false

        field :message_id, -> { String }, optional: true, nullable: false, api_name: "messageId"

        field :error_code, -> { String }, optional: true, nullable: false, api_name: "errorCode"

        field :error_message, -> { String }, optional: true, nullable: false, api_name: "errorMessage"

        field :sent_at, -> { String }, optional: true, nullable: false, api_name: "sentAt"
      end
    end
  end
end
