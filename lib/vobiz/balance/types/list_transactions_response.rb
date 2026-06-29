# frozen_string_literal: true

module Vobiz
  module Balance
    module Types
      class ListTransactionsResponse < Internal::Types::Model
        field :transactions, -> { Internal::Types::Array[Vobiz::Balance::Types::ListTransactionsResponseTransactionsItem] }, optional: false, nullable: false

        field :summary, -> { Vobiz::Balance::Types::ListTransactionsResponseSummary }, optional: false, nullable: false

        field :total, -> { Integer }, optional: false, nullable: false

        field :page, -> { Integer }, optional: false, nullable: false

        field :per_page, -> { Integer }, optional: false, nullable: false

        field :total_pages, -> { Integer }, optional: false, nullable: false
      end
    end
  end
end
