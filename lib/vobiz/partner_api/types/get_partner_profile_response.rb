# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class GetPartnerProfileResponse < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :account_id, -> { Integer }, optional: false, nullable: false

        field :name, -> { String }, optional: false, nullable: false

        field :slug, -> { String }, optional: false, nullable: false

        field :company, -> { String }, optional: false, nullable: false

        field :auth_id, -> { String }, optional: false, nullable: false

        field :email, -> { String }, optional: false, nullable: false

        field :phone, -> { String }, optional: false, nullable: false

        field :billing_model, -> { String }, optional: false, nullable: false

        field :is_active, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :is_verified, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :max_accounts, -> { Integer }, optional: false, nullable: false

        field :can_create_accounts, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :can_create_pricing_tiers, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :can_view_cdrs, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :can_transfer_balance, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :default_pricing_tier_id, -> { String }, optional: false, nullable: false

        field :account_count, -> { Integer }, optional: false, nullable: false

        field :balance, -> { String }, optional: false, nullable: false

        field :created_at, -> { String }, optional: false, nullable: false

        field :updated_at, -> { String }, optional: false, nullable: false
      end
    end
  end
end
