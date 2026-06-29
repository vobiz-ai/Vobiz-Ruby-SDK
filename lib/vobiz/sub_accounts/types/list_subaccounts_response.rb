# frozen_string_literal: true

module Vobiz
  module SubAccounts
    module Types
      class ListSubaccountsResponse < Internal::Types::Model
        field :sub_accounts, -> { Internal::Types::Array[Vobiz::SubAccounts::Types::ListSubaccountsResponseSubAccountsItem] }, optional: false, nullable: false

        field :total, -> { Integer }, optional: false, nullable: false

        field :page, -> { Integer }, optional: false, nullable: false

        field :size, -> { Integer }, optional: false, nullable: false
      end
    end
  end
end
