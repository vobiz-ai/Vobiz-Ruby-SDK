# frozen_string_literal: true

module Vobiz
  module Types
    class InventoryNumber < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :e164, -> { String }, optional: true, nullable: false

      field :country, -> { String }, optional: true, nullable: false

      field :region, -> { String }, optional: true, nullable: false

      field :status, -> { String }, optional: true, nullable: false

      field :setup_fee, -> { Integer }, optional: true, nullable: false

      field :monthly_fee, -> { Integer }, optional: true, nullable: false

      field :currency, -> { String }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false

      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
