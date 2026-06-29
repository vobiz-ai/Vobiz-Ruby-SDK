# frozen_string_literal: true

module Vobiz
  module Cdr
    module Types
      class GetCdrRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :call_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
