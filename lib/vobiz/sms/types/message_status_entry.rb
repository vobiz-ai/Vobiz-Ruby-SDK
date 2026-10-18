# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # One entry in a message's status history: a status the message reached and when.
      class MessageStatusEntry < Internal::Types::Model
        field :status, -> { Vobiz::Sms::Types::MessageStatusEntryStatus }, optional: true, nullable: false

        field :error_code, -> { String }, optional: true, nullable: false, api_name: "errorCode"

        field :error_message, -> { String }, optional: true, nullable: false, api_name: "errorMessage"

        field :provider, -> { String }, optional: true, nullable: false

        field :created_at, -> { String }, optional: true, nullable: false, api_name: "createdAt"
      end
    end
  end
end
