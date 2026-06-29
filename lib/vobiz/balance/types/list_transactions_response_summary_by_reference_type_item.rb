# frozen_string_literal: true

module Vobiz
  module Balance
    module Types
      class ListTransactionsResponseSummaryByReferenceTypeItem < Internal::Types::Model
        field :reference_type, -> { String }, optional: false, nullable: false

        field :total_debit, -> { Integer }, optional: false, nullable: false

        field :total_credit, -> { Integer }, optional: false, nullable: false

        field :count, -> { Integer }, optional: false, nullable: false
      end
    end
  end
end
