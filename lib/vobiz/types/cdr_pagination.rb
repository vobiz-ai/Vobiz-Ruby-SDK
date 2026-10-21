# frozen_string_literal: true

module Vobiz
  module Types
    # Page-based pagination returned in the `pagination` object of the CDR list and search endpoints and the partner
    # customer CDR endpoint. Loop while `has_next` is `true`, incrementing `page`.
    class CdrPagination < Internal::Types::Model
      field :page, -> { Integer }, optional: false, nullable: false

      field :per_page, -> { Integer }, optional: false, nullable: false

      field :total, -> { Integer }, optional: false, nullable: false

      field :pages, -> { Integer }, optional: false, nullable: false

      field :has_next, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :has_prev, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
