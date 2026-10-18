# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # One wallet charge raised for a purchased number: the initial purchase charge or a monthly renewal.
      class NumberBillingCharge < Internal::Types::Model
        field :purchase_id, -> { String }, optional: true, nullable: false, api_name: "purchaseId"

        field :kind, -> { Vobiz::Sms::Types::NumberBillingChargeKind }, optional: true, nullable: false

        field :period_start, -> { String }, optional: true, nullable: false, api_name: "periodStart"

        field :amount, -> { Integer }, optional: true, nullable: false

        field :currency, -> { String }, optional: true, nullable: false

        field :status, -> { Vobiz::Sms::Types::NumberBillingChargeStatus }, optional: true, nullable: false

        field :reference, -> { String }, optional: true, nullable: false

        field :attempts, -> { Integer }, optional: true, nullable: false

        field :attempted_at, -> { String }, optional: true, nullable: false, api_name: "attemptedAt"
      end
    end
  end
end
