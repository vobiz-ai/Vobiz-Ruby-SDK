# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class ListCustomerAccountsRequest < Internal::Types::Model
        field :page, -> { Integer }, optional: true, nullable: false

        field :per_page, -> { Integer }, optional: true, nullable: false

        field :search, -> { String }, optional: true, nullable: false
      end
    end
  end
end
