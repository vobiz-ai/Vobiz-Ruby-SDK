# frozen_string_literal: true

module Vobiz
  module SubAccounts
    module Types
      class CreateSubaccountResponseTokens < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :refresh_token, -> { String }, optional: false, nullable: false

        field :token_type, -> { String }, optional: false, nullable: false

        field :expires_in, -> { Integer }, optional: false, nullable: false
      end
    end
  end
end
