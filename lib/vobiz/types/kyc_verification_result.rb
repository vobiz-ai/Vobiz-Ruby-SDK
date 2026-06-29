# frozen_string_literal: true

module Vobiz
  module Types
    # Outcome of a single KYC verification step.
    class KycVerificationResult < Internal::Types::Model
      field :verification_type, -> { Vobiz::Types::KycVerificationResultVerificationType }, optional: false, nullable: false

      field :status, -> { Vobiz::Types::KycVerificationResultStatus }, optional: false, nullable: false

      field :kyc_calls_blocked, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :mock, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
