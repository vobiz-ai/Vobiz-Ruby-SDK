# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # A number you bought through Vobiz, with its price, lifecycle status and billing history.
      class NumberPurchase < Internal::Types::Model
        field :id, -> { String }, optional: true, nullable: false

        field :account_id, -> { String }, optional: true, nullable: false, api_name: "accountId"

        field :provider, -> { String }, optional: true, nullable: false

        field :e164, -> { String }, optional: true, nullable: false

        field :country_code, -> { String }, optional: true, nullable: false, api_name: "countryCode"

        field :type, -> { String }, optional: true, nullable: false

        field :capabilities, -> { Internal::Types::Array[String] }, optional: true, nullable: false

        field :setup_amount, -> { Integer }, optional: true, nullable: false, api_name: "setupAmount"

        field :monthly_amount, -> { Integer }, optional: true, nullable: false, api_name: "monthlyAmount"

        field :currency, -> { String }, optional: true, nullable: false

        field :status, -> { Vobiz::Sms::Types::NumberPurchaseStatus }, optional: true, nullable: false

        field :purchased_at, -> { String }, optional: true, nullable: false, api_name: "purchasedAt"

        field :next_billing_at, -> { String }, optional: true, nullable: false, api_name: "nextBillingAt"

        field :released_at, -> { String }, optional: true, nullable: false, api_name: "releasedAt"

        field :created_at, -> { String }, optional: true, nullable: false, api_name: "createdAt"

        field :updated_at, -> { String }, optional: true, nullable: false, api_name: "updatedAt"

        field :charges, -> { Internal::Types::Array[Vobiz::Sms::Types::NumberBillingCharge] }, optional: true, nullable: false
      end
    end
  end
end
