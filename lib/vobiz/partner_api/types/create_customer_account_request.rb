# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class CreateCustomerAccountRequest < Internal::Types::Model
        field :name, -> { String }, optional: false, nullable: false

        field :email, -> { String }, optional: false, nullable: false

        field :phone, -> { String }, optional: false, nullable: false

        field :password, -> { String }, optional: false, nullable: false

        field :company, -> { String }, optional: true, nullable: false

        field :country, -> { String }, optional: false, nullable: false
      end
    end
  end
end
