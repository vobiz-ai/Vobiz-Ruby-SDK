# frozen_string_literal: true

module Vobiz
  module SubAccountKycTestMode
    module Types
      class MockFinalizePendingKycRequest < Internal::Types::Model
        field :sub_auth_id, -> { String }, optional: false, nullable: false

        field :verification_type, -> { Vobiz::SubAccountKycTestMode::Types::MockFinalizePendingKycRequestVerificationType }, optional: false, nullable: false

        field :outcome, -> { Vobiz::SubAccountKycTestMode::Types::MockFinalizePendingKycRequestOutcome }, optional: false, nullable: false
      end
    end
  end
end
