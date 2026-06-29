# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class ListCustomerAccountsResponse < Internal::Types::Model
        field :accounts, -> { Internal::Types::Array[Vobiz::PartnerAPI::Types::ListCustomerAccountsResponseAccountsItem] }, optional: false, nullable: false

        field :total, -> { Integer }, optional: false, nullable: false

        field :page, -> { Integer }, optional: false, nullable: false

        field :size, -> { Integer }, optional: false, nullable: false
      end
    end
  end
end
