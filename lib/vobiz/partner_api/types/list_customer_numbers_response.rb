# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class ListCustomerNumbersResponse < Internal::Types::Model
        field :items, -> { Internal::Types::Array[Object] }, optional: false, nullable: false

        field :page, -> { Integer }, optional: false, nullable: false

        field :per_page, -> { Integer }, optional: false, nullable: false

        field :total, -> { Integer }, optional: false, nullable: false

        field :account_auth_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
