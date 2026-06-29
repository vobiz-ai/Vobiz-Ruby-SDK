# frozen_string_literal: true

module Vobiz
  module SubAccountKycTestMode
    module Types
      class MockSubaccountDigilockerInitiateRequest < Internal::Types::Model
        field :sub_auth_id, -> { String }, optional: false, nullable: false

        field :redirect_url, -> { String }, optional: false, nullable: false
      end
    end
  end
end
