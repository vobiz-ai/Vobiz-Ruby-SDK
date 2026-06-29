# frozen_string_literal: true

module Vobiz
  module Endpoints
    module Types
      class CreateEndpointResponse < Internal::Types::Model
        field :alias_, -> { String }, optional: false, nullable: false, api_name: "alias"

        field :endpoint_id, -> { String }, optional: false, nullable: false

        field :username, -> { String }, optional: false, nullable: false
      end
    end
  end
end
