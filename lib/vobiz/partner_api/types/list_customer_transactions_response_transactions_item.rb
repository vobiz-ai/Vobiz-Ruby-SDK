# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class ListCustomerTransactionsResponseTransactionsItem < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :account_id, -> { String }, optional: false, nullable: false

        field :balance_id, -> { String }, optional: false, nullable: false

        field :type, -> { String }, optional: false, nullable: false

        field :amount, -> { Integer }, optional: false, nullable: false

        field :currency, -> { String }, optional: false, nullable: false

        field :description, -> { String }, optional: false, nullable: false

        field :reference, -> { String }, optional: false, nullable: false

        field :status, -> { String }, optional: false, nullable: false

        field :processed_at, -> { String }, optional: false, nullable: false

        field :created_at, -> { String }, optional: false, nullable: false

        field :updated_at, -> { String }, optional: false, nullable: false
      end
    end
  end
end
