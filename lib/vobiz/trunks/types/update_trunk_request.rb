# frozen_string_literal: true

module Vobiz
  module Trunks
    module Types
      class UpdateTrunkRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :trunk_id, -> { String }, optional: false, nullable: false

        field :name, -> { String }, optional: true, nullable: false

        field :trunk_direction, -> { Vobiz::Trunks::Types::UpdateTrunkRequestTrunkDirection }, optional: true, nullable: false

        field :trunk_status, -> { Vobiz::Trunks::Types::UpdateTrunkRequestTrunkStatus }, optional: true, nullable: false

        field :secure, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :trunk_domain, -> { String }, optional: true, nullable: false

        field :transport, -> { Vobiz::Trunks::Types::UpdateTrunkRequestTransport }, optional: true, nullable: false

        field :inbound_destination, -> { String }, optional: true, nullable: false

        field :description, -> { String }, optional: true, nullable: false

        field :concurrent_calls_limit, -> { Integer }, optional: true, nullable: false

        field :cps_limit, -> { Integer }, optional: true, nullable: false

        field :credential_uuid, -> { String }, optional: true, nullable: false

        field :ipacl_uuid, -> { String }, optional: true, nullable: false

        field :primary_uri_uuid, -> { String }, optional: true, nullable: false

        field :fallback_uri_uuid, -> { String }, optional: true, nullable: false

        field :recording, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :enable_transcription, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :pii_redaction, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :pii_entity_types, -> { String }, optional: true, nullable: false

        field :webhook_url, -> { String }, optional: true, nullable: false

        field :webhook_method, -> { Vobiz::Trunks::Types::UpdateTrunkRequestWebhookMethod }, optional: true, nullable: false

        field :recording_webhook_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
