# frozen_string_literal: true

module Vobiz
  module Types
    # A SIP-enabled customer sub-account under your partner umbrella.
    class PartnerCustomer < Internal::Types::Model
      field :auth_id, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :email, -> { String }, optional: true, nullable: false

      field :status, -> { Vobiz::Types::PartnerCustomerStatus }, optional: true, nullable: false

      field :balance, -> { Integer }, optional: true, nullable: false

      field :currency, -> { String }, optional: true, nullable: false

      field :country, -> { String }, optional: true, nullable: false

      field :timezone, -> { String }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false
    end
  end
end
