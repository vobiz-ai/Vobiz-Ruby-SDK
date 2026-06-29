# frozen_string_literal: true

module Vobiz
  module Balance
    module Types
      class ListTransactionsResponseSummary < Internal::Types::Model
        field :total_transactions, -> { Integer }, optional: false, nullable: false

        field :total_debit, -> { Integer }, optional: false, nullable: false

        field :total_credit, -> { Integer }, optional: false, nullable: false

        field :net_amount, -> { Integer }, optional: false, nullable: false

        field :by_reference_type, -> { Internal::Types::Array[Vobiz::Balance::Types::ListTransactionsResponseSummaryByReferenceTypeItem] }, optional: false, nullable: false
      end
    end
  end
end
