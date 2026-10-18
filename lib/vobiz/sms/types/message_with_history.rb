# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # A message with its full status history, as returned by `GET /messages/{id}`. It has every field of the message
      # object plus `statusHistory`.
      class MessageWithHistory < Internal::Types::Model
        field :id, -> { String }, optional: true, nullable: false

        field :account_id, -> { String }, optional: true, nullable: false, api_name: "accountId"

        field :direction, -> { Vobiz::Sms::Types::MessageDirection }, optional: true, nullable: false

        field :channel, -> { Vobiz::Sms::Types::MessageChannel }, optional: true, nullable: false

        field :from, -> { String }, optional: true, nullable: false

        field :to, -> { String }, optional: true, nullable: false

        field :text, -> { String }, optional: true, nullable: false

        field :media_urls, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "mediaUrls"

        field :status, -> { Vobiz::Sms::Types::MessageStatus }, optional: true, nullable: false

        field :error_code, -> { String }, optional: true, nullable: false, api_name: "errorCode"

        field :error_message, -> { String }, optional: true, nullable: false, api_name: "errorMessage"

        field :tag, -> { String }, optional: true, nullable: false

        field :conversation_id, -> { String }, optional: true, nullable: false, api_name: "conversationId"

        field :scheduled_at, -> { String }, optional: true, nullable: false, api_name: "scheduledAt"

        field :created_at, -> { String }, optional: true, nullable: false, api_name: "createdAt"

        field :updated_at, -> { String }, optional: true, nullable: false, api_name: "updatedAt"

        field :status_history, -> { Internal::Types::Array[Vobiz::Sms::Types::MessageStatusEntry] }, optional: true, nullable: false, api_name: "statusHistory"
      end
    end
  end
end
