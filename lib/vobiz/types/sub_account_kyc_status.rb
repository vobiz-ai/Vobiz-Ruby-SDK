# frozen_string_literal: true

module Vobiz
  module Types
    # Aggregated KYC state for a sub-account.
    class SubAccountKycStatus < Internal::Types::Model
      field :sub_account_id, -> { String }, optional: true, nullable: false

      field :kyc_mode, -> { Vobiz::Types::SubAccountKycStatusKycMode }, optional: true, nullable: false

      field :business_type, -> { String }, optional: true, nullable: false

      field :overall_status, -> { Vobiz::Types::SubAccountKycStatusOverallStatus }, optional: true, nullable: false

      field :kyc_calls_blocked, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :verifications, -> { Internal::Types::Hash[String, Vobiz::Types::SubAccountKycStatusVerificationsValue] }, optional: true, nullable: false
    end
  end
end
