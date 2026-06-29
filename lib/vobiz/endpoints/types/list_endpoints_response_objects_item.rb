# frozen_string_literal: true

module Vobiz
  module Endpoints
    module Types
      class ListEndpointsResponseObjectsItem < Internal::Types::Model
        field :alias_, -> { String }, optional: false, nullable: false, api_name: "alias"

        field :application, -> { String }, optional: false, nullable: true

        field :endpoint_id, -> { String }, optional: false, nullable: false

        field :resource_uri, -> { String }, optional: false, nullable: false

        field :sip_registered, -> { String }, optional: false, nullable: false

        field :sip_uri, -> { String }, optional: false, nullable: false

        field :sub_account, -> { Object }, optional: false, nullable: true

        field :username, -> { String }, optional: false, nullable: false
      end
    end
  end
end
