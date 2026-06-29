# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class ListCustomerTransactionsResponseSummary < Internal::Types::Model
        field :total_transactions, -> { Integer }, optional: false, nullable: false

        field :total_debit, -> { Integer }, optional: false, nullable: false

        field :total_credit, -> { Integer }, optional: false, nullable: false

        field :net_amount, -> { Integer }, optional: false, nullable: false

        field :by_reference_type, -> { Internal::Types::Array[Vobiz::PartnerAPI::Types::ListCustomerTransactionsResponseSummaryByReferenceTypeItem] }, optional: false, nullable: false
      end
    end
  end
end
