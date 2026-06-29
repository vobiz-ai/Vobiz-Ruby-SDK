# frozen_string_literal: true

module Vobiz
  module Balance
    module Types
      class ListTransactionsRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :limit, -> { Integer }, optional: true, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
