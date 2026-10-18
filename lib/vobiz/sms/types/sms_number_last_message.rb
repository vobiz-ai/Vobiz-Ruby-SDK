# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # The latest outbound message sent from a number, for a quick health check. `null` when the number has not sent a
      # message yet.
      class SmsNumberLastMessage < Internal::Types::Model
        field :status, -> { Vobiz::Sms::Types::SmsNumberLastMessageStatus }, optional: true, nullable: false

        field :error_code, -> { String }, optional: true, nullable: false, api_name: "errorCode"

        field :error_message, -> { String }, optional: true, nullable: false, api_name: "errorMessage"

        field :to, -> { String }, optional: true, nullable: false

        field :created_at, -> { String }, optional: true, nullable: false, api_name: "createdAt"
      end
    end
  end
end
