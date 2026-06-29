# frozen_string_literal: true

module Vobiz
  module Types
    # A DID phone number assigned to a customer account under the partner umbrella.
    class PartnerNumber < Internal::Types::Model
      field :number, -> { String }, optional: true, nullable: false

      field :account_auth_id, -> { String }, optional: true, nullable: false

      field :account_name, -> { String }, optional: true, nullable: false

      field :number_type, -> { String }, optional: true, nullable: false

      field :country, -> { String }, optional: true, nullable: false

      field :region, -> { String }, optional: true, nullable: false

      field :status, -> { Vobiz::Types::PartnerNumberStatus }, optional: true, nullable: false

      field :application_id, -> { String }, optional: true, nullable: false

      field :application_name, -> { String }, optional: true, nullable: false

      field :trunk_id, -> { String }, optional: true, nullable: false

      field :monthly_cost, -> { Integer }, optional: true, nullable: false

      field :currency, -> { String }, optional: true, nullable: false

      field :assigned_at, -> { String }, optional: true, nullable: false

      field :expires_at, -> { String }, optional: true, nullable: false
    end
  end
end
