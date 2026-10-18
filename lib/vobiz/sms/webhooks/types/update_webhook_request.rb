# frozen_string_literal: true

module Vobiz
  module Sms
    module Webhooks
      module Types
        class UpdateWebhookRequest < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :url, -> { String }, optional: true, nullable: false

          field :secret, -> { String }, optional: true, nullable: false

          field :events, -> { Internal::Types::Array[Vobiz::Sms::Types::WebhookEvent] }, optional: true, nullable: false

          field :active, -> { Internal::Types::Boolean }, optional: true, nullable: false
        end
      end
    end
  end
end
