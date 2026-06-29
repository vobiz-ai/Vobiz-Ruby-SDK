# frozen_string_literal: true

module Vobiz
  module Applications
    module Types
      class RetrieveApplicationResponse < Internal::Types::Model
        field :answer_method, -> { String }, optional: false, nullable: false

        field :answer_url, -> { String }, optional: false, nullable: false

        field :api_id, -> { String }, optional: false, nullable: false

        field :app_id, -> { String }, optional: false, nullable: false

        field :app_name, -> { String }, optional: false, nullable: false

        field :application_type, -> { String }, optional: false, nullable: false

        field :created_at, -> { String }, optional: false, nullable: false

        field :default_app, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :default_endpoint_app, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :fallback_answer_url, -> { Object }, optional: false, nullable: true

        field :fallback_method, -> { String }, optional: false, nullable: false

        field :hangup_method, -> { String }, optional: false, nullable: false

        field :hangup_url, -> { String }, optional: false, nullable: false

        field :log_incoming_message, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :message_method, -> { String }, optional: false, nullable: false

        field :message_url, -> { Object }, optional: false, nullable: true

        field :public_uri, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :resource_uri, -> { String }, optional: false, nullable: false

        field :sip_transfer_method, -> { String }, optional: false, nullable: false

        field :sip_transfer_url, -> { Object }, optional: false, nullable: true

        field :sip_uri, -> { String }, optional: false, nullable: false

        field :sub_account, -> { Object }, optional: false, nullable: true

        field :updated_at, -> { String }, optional: false, nullable: false
      end
    end
  end
end
