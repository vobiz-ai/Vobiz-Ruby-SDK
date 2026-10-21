# frozen_string_literal: true

module Vobiz
  module Types
    # Offset-based pagination metadata returned in the `meta` object of the Application, Endpoint and Recording list
    # endpoints. To fetch the next page, add `limit` to `offset`, or request the `next` URL as-is.
    class PaginationMeta < Internal::Types::Model
      field :limit, -> { Integer }, optional: false, nullable: false

      field :offset, -> { Integer }, optional: false, nullable: false

      field :total_count, -> { Integer }, optional: false, nullable: false

      field :next_, -> { String }, optional: false, nullable: true, api_name: "next"

      field :previous, -> { String }, optional: false, nullable: true
    end
  end
end
