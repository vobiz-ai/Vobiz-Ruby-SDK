# frozen_string_literal: true

module Vobiz
  module Types
    class Endpoint < Internal::Types::Model
      field :endpoint_id, -> { String }, optional: true, nullable: false

      field :username, -> { String }, optional: true, nullable: false

      field :alias_, -> { String }, optional: true, nullable: false, api_name: "alias"

      field :sip_uri, -> { String }, optional: true, nullable: false

      field :sip_registered, -> { Vobiz::Types::EndpointSipRegistered }, optional: true, nullable: false

      field :sip_contact, -> { String }, optional: true, nullable: false

      field :sip_expires, -> { String }, optional: true, nullable: false

      field :sip_user_agent, -> { String }, optional: true, nullable: false

      field :application, -> { Vobiz::Types::EndpointApplication }, optional: true, nullable: false

      field :allow_voice, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :allow_message, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :allow_video, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :allow_same_domain, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :allow_other_domains, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :allow_phones, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :allow_apps, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :sub_account, -> { String }, optional: true, nullable: false

      field :resource_uri, -> { String }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false

      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
