# frozen_string_literal: true

module Vobiz
  module Balance
    module Types
      class ListTransactionReferenceTypesResponse < Internal::Types::Model
        field :reference_types, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      end
    end
  end
end
