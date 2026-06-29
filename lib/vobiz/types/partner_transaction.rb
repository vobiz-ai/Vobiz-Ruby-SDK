# frozen_string_literal: true

module Vobiz
  module Types
    # A single credit or debit ledger entry on a partner or customer account.
    class PartnerTransaction < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :type, -> { Vobiz::Types::PartnerTransactionType }, optional: true, nullable: false

      field :amount, -> { Integer }, optional: true, nullable: false

      field :currency, -> { String }, optional: true, nullable: false

      field :balance_before, -> { Integer }, optional: true, nullable: false

      field :balance_after, -> { Integer }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :initiated_by, -> { String }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false
    end
  end
end
