# frozen_string_literal: true

module Vobiz
  module Types
    # Partner identity, balance, GST configuration, and permanent partner ID.
    class PartnerProfile < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :email, -> { String }, optional: true, nullable: false

      field :phone, -> { String }, optional: true, nullable: false

      field :company, -> { String }, optional: true, nullable: false

      field :balance, -> { Integer }, optional: true, nullable: false

      field :currency, -> { String }, optional: true, nullable: false

      field :gstin, -> { String }, optional: true, nullable: false

      field :gst_status, -> { String }, optional: true, nullable: false

      field :tds_applicable, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :tds_percentage, -> { Integer }, optional: true, nullable: false

      field :account_type, -> { String }, optional: true, nullable: false

      field :status, -> { String }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false

      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
