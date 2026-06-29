# frozen_string_literal: true

module Vobiz
  module Endpoints
    module Types
      class DeleteEndpointRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :endpoint_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
