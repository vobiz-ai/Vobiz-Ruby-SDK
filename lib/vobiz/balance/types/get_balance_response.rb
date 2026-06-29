# frozen_string_literal: true

module Vobiz
  module Balance
    module Types
      class GetBalanceResponse < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :account_id, -> { String }, optional: false, nullable: false

        field :currency, -> { String }, optional: false, nullable: false

        field :balance, -> { Integer }, optional: false, nullable: false

        field :reserved_funds, -> { Integer }, optional: false, nullable: false

        field :promotional_balance, -> { Integer }, optional: false, nullable: false

        field :promotional_reserved_balance, -> { Integer }, optional: false, nullable: false

        field :available_balance, -> { Integer }, optional: false, nullable: false

        field :credit_limit, -> { Integer }, optional: false, nullable: false

        field :is_postpaid, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :credit_limit_type, -> { String }, optional: false, nullable: false

        field :low_balance_threshold, -> { Integer }, optional: false, nullable: false

        field :status, -> { String }, optional: false, nullable: false

        field :created_at, -> { String }, optional: false, nullable: false

        field :updated_at, -> { String }, optional: false, nullable: false
      end
    end
  end
end
