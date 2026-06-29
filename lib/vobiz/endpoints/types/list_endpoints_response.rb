# frozen_string_literal: true

module Vobiz
  module Endpoints
    module Types
      class ListEndpointsResponse < Internal::Types::Model
        field :api_id, -> { String }, optional: false, nullable: false

        field :meta, -> { Vobiz::Endpoints::Types::ListEndpointsResponseMeta }, optional: false, nullable: false

        field :objects, -> { Internal::Types::Array[Vobiz::Endpoints::Types::ListEndpointsResponseObjectsItem] }, optional: false, nullable: false
      end
    end
  end
end
