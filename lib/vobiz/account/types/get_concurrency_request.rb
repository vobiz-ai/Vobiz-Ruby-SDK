# frozen_string_literal: true

module Vobiz
  module Account
    module Types
      class GetConcurrencyRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
