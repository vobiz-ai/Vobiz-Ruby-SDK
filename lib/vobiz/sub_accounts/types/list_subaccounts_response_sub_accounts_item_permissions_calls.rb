# frozen_string_literal: true

module Vobiz
  module SubAccounts
    module Types
      class ListSubaccountsResponseSubAccountsItemPermissionsCalls < Internal::Types::Model
        field :cdr, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :calls, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
