# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class ListCustomerTransactionsResponse < Internal::Types::Model
        field :transactions, -> { Internal::Types::Array[Vobiz::PartnerAPI::Types::ListCustomerTransactionsResponseTransactionsItem] }, optional: false, nullable: false

        field :summary, -> { Vobiz::PartnerAPI::Types::ListCustomerTransactionsResponseSummary }, optional: false, nullable: false

        field :total, -> { Integer }, optional: false, nullable: false

        field :page, -> { Integer }, optional: false, nullable: false

        field :per_page, -> { Integer }, optional: false, nullable: false

        field :total_pages, -> { Integer }, optional: false, nullable: false

        field :account_auth_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
