# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # A bulk SMS send that renders one template for every recipient of an uploaded list and sends at a controlled
      # rate. Its `status` moves from `draft` through `scheduled` or `running` to `completed`, `cancelled` or `failed`,
      # and `stats` counts recipients by state.
      class Broadcast < Internal::Types::Model
        field :id, -> { String }, optional: true, nullable: false

        field :account_id, -> { String }, optional: true, nullable: false, api_name: "accountId"

        field :name, -> { String }, optional: true, nullable: false

        field :from, -> { String }, optional: true, nullable: false

        field :channel, -> { Vobiz::Sms::Types::BroadcastChannel }, optional: true, nullable: false

        field :template, -> { String }, optional: true, nullable: false

        field :status, -> { Vobiz::Sms::Types::BroadcastStatus }, optional: true, nullable: false

        field :pause_reason, -> { Vobiz::Sms::Types::BroadcastPauseReason }, optional: true, nullable: false, api_name: "pauseReason"

        field :scheduled_at, -> { String }, optional: true, nullable: false, api_name: "scheduledAt"

        field :rate_per_second, -> { Integer }, optional: true, nullable: false, api_name: "ratePerSecond"

        field :tag, -> { String }, optional: true, nullable: false

        field :dlt_entity_id, -> { String }, optional: true, nullable: false, api_name: "dltEntityId"

        field :dlt_header_id, -> { String }, optional: true, nullable: false, api_name: "dltHeaderId"

        field :dlt_template_id, -> { String }, optional: true, nullable: false, api_name: "dltTemplateId"

        field :columns, -> { Internal::Types::Array[String] }, optional: true, nullable: false

        field :stats, -> { Vobiz::Sms::Types::BroadcastStats }, optional: true, nullable: false

        field :created_at, -> { String }, optional: true, nullable: false, api_name: "createdAt"

        field :updated_at, -> { String }, optional: true, nullable: false, api_name: "updatedAt"

        field :started_at, -> { String }, optional: true, nullable: false, api_name: "startedAt"

        field :completed_at, -> { String }, optional: true, nullable: false, api_name: "completedAt"
      end
    end
  end
end
