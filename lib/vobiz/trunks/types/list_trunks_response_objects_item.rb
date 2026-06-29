# frozen_string_literal: true

module Vobiz
  module Trunks
    module Types
      class ListTrunksResponseObjectsItem < Internal::Types::Model
        field :trunk_id, -> { String }, optional: false, nullable: false

        field :account_id, -> { String }, optional: false, nullable: false

        field :name, -> { String }, optional: false, nullable: false

        field :trunk_domain, -> { String }, optional: false, nullable: false

        field :trunk_status, -> { String }, optional: false, nullable: false

        field :secure, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :trunk_direction, -> { String }, optional: false, nullable: false

        field :concurrent_calls_limit, -> { Integer }, optional: false, nullable: false

        field :cps_limit, -> { Integer }, optional: false, nullable: false

        field :credential_uuid, -> { String }, optional: true, nullable: false

        field :description, -> { String }, optional: false, nullable: false

        field :transport, -> { String }, optional: false, nullable: false

        field :recording, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :enable_transcription, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :pii_redaction, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :webhook_method, -> { String }, optional: false, nullable: false

        field :recording_webhook_enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :created_at, -> { String }, optional: false, nullable: false

        field :updated_at, -> { String }, optional: false, nullable: false

        field :primary_uri_uuid, -> { String }, optional: true, nullable: false

        field :inbound_destination, -> { String }, optional: true, nullable: false

        field :pii_entity_types, -> { String }, optional: true, nullable: false

        field :webhook_url, -> { String }, optional: true, nullable: false
      end
    end
  end
end
