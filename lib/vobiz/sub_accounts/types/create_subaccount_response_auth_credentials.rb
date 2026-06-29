# frozen_string_literal: true

module Vobiz
  module SubAccounts
    module Types
      class CreateSubaccountResponseAuthCredentials < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :auth_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
