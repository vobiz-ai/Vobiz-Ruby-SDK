# frozen_string_literal: true

module Vobiz
  module Cdr
    module Types
      class SearchCdrsResponsePagination < Internal::Types::Model
        field :page, -> { Integer }, optional: false, nullable: false

        field :per_page, -> { Integer }, optional: false, nullable: false

        field :total, -> { Integer }, optional: false, nullable: false

        field :pages, -> { Integer }, optional: false, nullable: false

        field :has_next, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :has_prev, -> { Internal::Types::Boolean }, optional: false, nullable: false
      end
    end
  end
end
