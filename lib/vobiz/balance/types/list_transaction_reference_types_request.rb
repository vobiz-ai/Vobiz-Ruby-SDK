# frozen_string_literal: true

module Vobiz
  module Balance
    module Types
      class ListTransactionReferenceTypesRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
