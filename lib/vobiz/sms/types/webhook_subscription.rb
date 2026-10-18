# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # A webhook subscription: the URL Vobiz delivers your chosen events to, and the secret used to sign them.
      class WebhookSubscription < Internal::Types::Model
        field :id, -> { String }, optional: true, nullable: false

        field :account_id, -> { String }, optional: true, nullable: false, api_name: "accountId"

        field :url, -> { String }, optional: true, nullable: false

        field :secret, -> { String }, optional: true, nullable: false

        field :events, -> { Internal::Types::Array[Vobiz::Sms::Types::WebhookEvent] }, optional: true, nullable: false

        field :active, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :created_at, -> { String }, optional: true, nullable: false, api_name: "createdAt"
      end
    end
  end
end
