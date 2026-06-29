# frozen_string_literal: true

module Vobiz
  module Account
    module Types
      class RetrieveAccountResponse < Internal::Types::Model
        field :type, -> { String }, optional: false, nullable: false

        field :id, -> { String }, optional: false, nullable: false

        field :api_id, -> { String }, optional: false, nullable: false

        field :name, -> { String }, optional: false, nullable: false

        field :email, -> { String }, optional: false, nullable: false

        field :phone, -> { String }, optional: false, nullable: false

        field :description, -> { String }, optional: false, nullable: false

        field :auth_id, -> { String }, optional: false, nullable: false

        field :auth_secret, -> { String }, optional: false, nullable: false

        field :auth_token_expire_time, -> { Object }, optional: false, nullable: true

        field :country, -> { String }, optional: false, nullable: false

        field :timezone, -> { String }, optional: false, nullable: false

        field :city, -> { String }, optional: false, nullable: false

        field :state, -> { String }, optional: false, nullable: false

        field :address, -> { String }, optional: false, nullable: false

        field :zip_code, -> { String }, optional: false, nullable: false

        field :company, -> { String }, optional: false, nullable: false

        field :account_type, -> { String }, optional: false, nullable: false

        field :postpaid, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :auto_recharge, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :auto_recharge_config, -> { Object }, optional: false, nullable: true

        field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :carrier_type, -> { Object }, optional: false, nullable: true

        field :customer_type, -> { Object }, optional: false, nullable: true

        field :credit_limit, -> { Integer }, optional: false, nullable: false

        field :cps_limit, -> { Integer }, optional: false, nullable: false

        field :concurrent_calls_limit, -> { Integer }, optional: false, nullable: false

        field :base_cps_limit, -> { Integer }, optional: false, nullable: false

        field :base_concurrent_calls_limit, -> { Integer }, optional: false, nullable: false

        field :purchased_cps, -> { Integer }, optional: false, nullable: false

        field :purchased_concurrent_calls, -> { Integer }, optional: false, nullable: false

        field :risk_rating, -> { Integer }, optional: false, nullable: false

        field :risk_status, -> { Object }, optional: false, nullable: true

        field :features, -> { Vobiz::Account::Types::RetrieveAccountResponseFeatures }, optional: false, nullable: false

        field :ip_auth_enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :ip_whitelist_rules, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false

        field :allow_aws_ips, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :role, -> { String }, optional: false, nullable: false

        field :is_active, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :is_verified, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :is_trial_account, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :created_at, -> { String }, optional: false, nullable: false

        field :updated_at, -> { String }, optional: false, nullable: false

        field :last_login, -> { String }, optional: false, nullable: false

        field :pricing_tier_id, -> { String }, optional: false, nullable: false

        field :pricing_tier, -> { Vobiz::Account::Types::RetrieveAccountResponsePricingTier }, optional: false, nullable: false
      end
    end
  end
end
