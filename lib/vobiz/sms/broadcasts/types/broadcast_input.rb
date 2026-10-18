# frozen_string_literal: true

module Vobiz
  module Sms
    module Broadcasts
      module Types
        class BroadcastInput < Internal::Types::Model
          field :name, -> { String }, optional: true, nullable: false

          field :from, -> { String }, optional: true, nullable: false

          field :channel, -> { Vobiz::Sms::Types::BroadcastUpdateInputChannel }, optional: true, nullable: false

          field :template, -> { String }, optional: true, nullable: false

          field :scheduled_at, -> { String }, optional: true, nullable: false, api_name: "scheduledAt"

          field :rate_per_second, -> { Integer }, optional: true, nullable: false, api_name: "ratePerSecond"

          field :tag, -> { String }, optional: true, nullable: false

          field :dlt_entity_id, -> { String }, optional: true, nullable: false, api_name: "dltEntityId"

          field :dlt_header_id, -> { String }, optional: true, nullable: false, api_name: "dltHeaderId"

          field :dlt_template_id, -> { String }, optional: true, nullable: false, api_name: "dltTemplateId"
        end
      end
    end
  end
end
