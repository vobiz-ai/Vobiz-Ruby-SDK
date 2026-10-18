# frozen_string_literal: true

module Vobiz
  module Sms
    module Webhooks
      module Types
        class CreateWebhookRequest < Internal::Types::Model
          field :url, -> { String }, optional: false, nullable: false

          field :secret, -> { String }, optional: true, nullable: false

          field :events, -> { Internal::Types::Array[Vobiz::Sms::Types::WebhookEvent] }, optional: true, nullable: false
        end
      end
    end
  end
end
