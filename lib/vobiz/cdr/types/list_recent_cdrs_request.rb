# frozen_string_literal: true

module Vobiz
  module Cdr
    module Types
      class ListRecentCdrsRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :limit, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
