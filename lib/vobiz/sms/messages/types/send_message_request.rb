# frozen_string_literal: true

module Vobiz
  module Sms
    module Messages
      module Types
        class SendMessageRequest < Internal::Types::Model
          field :from, -> { String }, optional: false, nullable: false

          field :to, -> { Internal::Types::Array[String] }, optional: false, nullable: false

          field :channel, -> { Vobiz::Sms::Messages::Types::SendMessageRequestChannel }, optional: true, nullable: false

          field :text, -> { String }, optional: true, nullable: false

          field :media_urls, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "mediaUrls"

          field :title, -> { String }, optional: true, nullable: false

          field :tag, -> { String }, optional: true, nullable: false

          field :idempotency_key, -> { String }, optional: true, nullable: false, api_name: "idempotencyKey"

          field :scheduled_at, -> { String }, optional: true, nullable: false, api_name: "scheduledAt"

          field :failover_to_sms, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "failoverToSms"

          field :rcs_suggestions, -> { Internal::Types::Array[Vobiz::Sms::Types::RcsSuggestion] }, optional: true, nullable: false, api_name: "rcsSuggestions"

          field :dlt_entity_id, -> { String }, optional: true, nullable: false, api_name: "dltEntityId"

          field :dlt_header_id, -> { String }, optional: true, nullable: false, api_name: "dltHeaderId"

          field :dlt_template_id, -> { String }, optional: true, nullable: false, api_name: "dltTemplateId"
        end
      end
    end
  end
end
