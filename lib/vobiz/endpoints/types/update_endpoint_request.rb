# frozen_string_literal: true

module Vobiz
  module Endpoints
    module Types
      class UpdateEndpointRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :endpoint_id, -> { String }, optional: false, nullable: false

        field :alias_, -> { String }, optional: false, nullable: false, api_name: "alias"

        field :password, -> { String }, optional: false, nullable: false
      end
    end
  end
end
