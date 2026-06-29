# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class ListCustomerTransactionsRequest < Internal::Types::Model
        field :customer_auth_id, -> { String }, optional: false, nullable: false

        field :from_date, -> { String }, optional: true, nullable: false

        field :to_date, -> { String }, optional: true, nullable: false

        field :transaction_type, -> { Vobiz::PartnerAPI::Types::ListCustomerTransactionsRequestTransactionType }, optional: true, nullable: false

        field :page, -> { Integer }, optional: true, nullable: false

        field :per_page, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
