# frozen_string_literal: true

module Vobiz
  module Types
    class Application < Internal::Types::Model
      field :app_id, -> { String }, optional: true, nullable: false

      field :app_name, -> { String }, optional: true, nullable: false

      field :application_type, -> { String }, optional: true, nullable: false

      field :answer_url, -> { String }, optional: true, nullable: false

      field :answer_method, -> { Vobiz::Types::ApplicationAnswerMethod }, optional: true, nullable: false

      field :hangup_url, -> { String }, optional: true, nullable: false

      field :hangup_method, -> { Vobiz::Types::ApplicationHangupMethod }, optional: true, nullable: false

      field :fallback_answer_url, -> { String }, optional: true, nullable: false

      field :fallback_method, -> { Vobiz::Types::ApplicationFallbackMethod }, optional: true, nullable: false

      field :message_url, -> { String }, optional: true, nullable: false

      field :message_method, -> { Vobiz::Types::ApplicationMessageMethod }, optional: true, nullable: false

      field :default_number_app, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :default_endpoint_app, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :default_app, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :log_incoming_message, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :public_uri, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :sip_transfer_url, -> { String }, optional: true, nullable: false

      field :sip_transfer_method, -> { Vobiz::Types::ApplicationSipTransferMethod }, optional: true, nullable: false

      field :sip_uri, -> { String }, optional: true, nullable: false

      field :sub_account, -> { String }, optional: true, nullable: false

      field :resource_uri, -> { String }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false

      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
