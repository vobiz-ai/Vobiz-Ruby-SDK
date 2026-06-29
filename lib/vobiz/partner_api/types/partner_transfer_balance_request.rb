# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class PartnerTransferBalanceRequest < Internal::Types::Model
        field :customer_auth_id, -> { String }, optional: false, nullable: false

        field :amount, -> { Integer }, optional: false, nullable: false

        field :currency, -> { String }, optional: false, nullable: false

        field :description, -> { String }, optional: true, nullable: false
      end
    end
  end
end
