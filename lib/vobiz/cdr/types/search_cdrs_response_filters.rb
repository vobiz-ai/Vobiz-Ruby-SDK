# frozen_string_literal: true

module Vobiz
  module Cdr
    module Types
      class SearchCdrsResponseFilters < Internal::Types::Model
        field :call_direction, -> { String }, optional: false, nullable: false

        field :from_number, -> { String }, optional: false, nullable: false

        field :hangup_cause, -> { String }, optional: false, nullable: false

        field :to_number, -> { String }, optional: false, nullable: false
      end
    end
  end
end
