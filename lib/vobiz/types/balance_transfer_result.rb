# frozen_string_literal: true

module Vobiz
  module Types
    # Result of an atomic transfer from the partner master wallet to a customer sub-account.
    class BalanceTransferResult < Internal::Types::Model
      field :transaction_id, -> { String }, optional: true, nullable: false

      field :customer_auth_id, -> { String }, optional: true, nullable: false

      field :amount, -> { Integer }, optional: true, nullable: false

      field :currency, -> { String }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :partner_balance_after, -> { Integer }, optional: true, nullable: false

      field :customer_balance_after, -> { Integer }, optional: true, nullable: false

      field :status, -> { Vobiz::Types::BalanceTransferResultStatus }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false
    end
  end
end
