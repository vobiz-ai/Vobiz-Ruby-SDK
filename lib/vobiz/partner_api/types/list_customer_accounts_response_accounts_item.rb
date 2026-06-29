# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class ListCustomerAccountsResponseAccountsItem < Internal::Types::Model
        field :name, -> { String }, optional: false, nullable: false

        field :email, -> { String }, optional: false, nullable: false

        field :phone, -> { String }, optional: false, nullable: false

        field :description, -> { String }, optional: false, nullable: true

        field :gstin, -> { String }, optional: false, nullable: true

        field :gst_status, -> { String }, optional: false, nullable: true

        field :tds_enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :tds_percentage, -> { Integer }, optional: false, nullable: false

        field :business_type, -> { String }, optional: false, nullable: false

        field :id, -> { String }, optional: false, nullable: false

        field :auth_id, -> { String }, optional: false, nullable: false

        field :api_id, -> { String }, optional: false, nullable: false

        field :account_type, -> { String }, optional: false, nullable: false

        field :role, -> { String }, optional: false, nullable: false

        field :postpaid, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :address, -> { String }, optional: false, nullable: true

        field :city, -> { String }, optional: false, nullable: true

        field :state, -> { String }, optional: false, nullable: true

        field :timezone, -> { String }, optional: false, nullable: true

        field :country, -> { String }, optional: false, nullable: false

        field :zip_code, -> { String }, optional: false, nullable: true

        field :company, -> { String }, optional: false, nullable: false

        field :billing_mode, -> { String }, optional: false, nullable: false

        field :auto_recharge, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :cash_credits, -> { String }, optional: false, nullable: false

        field :cps_limit, -> { Integer }, optional: false, nullable: false

        field :concurrent_calls_limit, -> { Integer }, optional: false, nullable: false

        field :base_cps_limit, -> { Object }, optional: false, nullable: true

        field :base_concurrent_calls_limit, -> { Object }, optional: false, nullable: true

        field :purchased_cps, -> { Object }, optional: false, nullable: true

        field :purchased_concurrent_calls, -> { Object }, optional: false, nullable: true

        field :is_active, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :is_verified, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :is_trial_account, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :kyc_status, -> { String }, optional: false, nullable: false

        field :google_id, -> { Object }, optional: false, nullable: true

        field :referral_code, -> { String }, optional: false, nullable: true

        field :referral_disabled, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :custom_referrer_reward_amount, -> { Object }, optional: false, nullable: true

        field :custom_referee_reward_amount, -> { Object }, optional: false, nullable: true

        field :created_at, -> { String }, optional: false, nullable: false

        field :updated_at, -> { String }, optional: false, nullable: false

        field :last_login, -> { String }, optional: false, nullable: true

        field :pricing_tier_id, -> { String }, optional: false, nullable: false

        field :pricing_tier, -> { Vobiz::PartnerAPI::Types::ListCustomerAccountsResponseAccountsItemPricingTier }, optional: false, nullable: false

        field :partner_id, -> { String }, optional: false, nullable: false

        field :auto_recharge_config, -> { Object }, optional: false, nullable: true

        field :resource_uri, -> { String }, optional: false, nullable: false

        field :auth_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
