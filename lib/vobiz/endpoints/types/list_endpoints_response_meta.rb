# frozen_string_literal: true

module Vobiz
  module Endpoints
    module Types
      class ListEndpointsResponseMeta < Internal::Types::Model
        field :limit, -> { Integer }, optional: false, nullable: false

        field :offset, -> { Integer }, optional: false, nullable: false

        field :total_count, -> { Integer }, optional: false, nullable: false

        field :next_, -> { Object }, optional: false, nullable: true, api_name: "next"

        field :previous, -> { Object }, optional: false, nullable: true
      end
    end
  end
end
