# frozen_string_literal: true

module Vobiz
  module Balance
    module Types
      class ListTransactionsRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :page, -> { Integer }, optional: true, nullable: false

        field :per_page, -> { Integer }, optional: true, nullable: false

        field :from_date, -> { String }, optional: true, nullable: false

        field :to_date, -> { String }, optional: true, nullable: false

        field :type, -> { String }, optional: true, nullable: false

        field :status, -> { Vobiz::Balance::Types::ListTransactionsRequestStatus }, optional: true, nullable: false

        field :currency, -> { String }, optional: true, nullable: false

        field :reference_type, -> { String }, optional: true, nullable: false

        field :description, -> { String }, optional: true, nullable: false

        field :reference, -> { String }, optional: true, nullable: false

        field :transaction_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
