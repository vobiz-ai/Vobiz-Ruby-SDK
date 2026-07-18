# frozen_string_literal: true

module Vobiz
  module Types
    class ChannelSubscription < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :account_id, -> { Integer }, optional: false, nullable: false

      field :resource_type, -> { Vobiz::Types::CapacityResourceType }, optional: false, nullable: false

      field :quantity, -> { Integer }, optional: false, nullable: false

      field :monthly_cost, -> { String }, optional: false, nullable: false

      field :currency, -> { String }, optional: false, nullable: false

      field :status, -> { String }, optional: false, nullable: false

      field :last_billing_date, -> { String }, optional: false, nullable: false

      field :next_billing_date, -> { String }, optional: false, nullable: false

      field :purchased_at, -> { String }, optional: false, nullable: false

      field :cancelled_at, -> { String }, optional: false, nullable: true

      field :cancellation_reason, -> { String }, optional: false, nullable: true

      field :is_active, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false

      field :updated_at, -> { String }, optional: false, nullable: false
    end
  end
end
