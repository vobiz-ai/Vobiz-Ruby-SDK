# frozen_string_literal: true

module Vobiz
  module SubAccountKycTestMode
    module Types
      class MockSubaccountDigilockerVerifyRequest < Internal::Types::Model
        field :sub_auth_id, -> { String }, optional: false, nullable: false

        field :access_request_id, -> { Vobiz::SubAccountKycTestMode::Types::MockSubaccountDigilockerVerifyRequestAccessRequestID }, optional: false, nullable: false
      end
    end
  end
end
