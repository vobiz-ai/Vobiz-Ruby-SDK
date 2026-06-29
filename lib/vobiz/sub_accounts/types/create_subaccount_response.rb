# frozen_string_literal: true

module Vobiz
  module SubAccounts
    module Types
      class CreateSubaccountResponse < Internal::Types::Model
        field :message, -> { String }, optional: false, nullable: false

        field :sub_account, -> { Vobiz::SubAccounts::Types::CreateSubaccountResponseSubAccount }, optional: false, nullable: false

        field :auth_credentials, -> { Vobiz::SubAccounts::Types::CreateSubaccountResponseAuthCredentials }, optional: false, nullable: false

        field :tokens, -> { Vobiz::SubAccounts::Types::CreateSubaccountResponseTokens }, optional: false, nullable: false
      end
    end
  end
end
