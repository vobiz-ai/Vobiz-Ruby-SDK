# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class ListCustomerNumbersRequest < Internal::Types::Model
        field :customer_auth_id, -> { String }, optional: false, nullable: false

        field :search, -> { String }, optional: true, nullable: false

        field :page, -> { Integer }, optional: true, nullable: false

        field :per_page, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
