# frozen_string_literal: true

module Vobiz
  module SubAccounts
    module Types
      class ListSubaccountsResponseSubAccountsItemPermissions < Internal::Types::Model
        extend Vobiz::Internal::Types::Union

        member -> { Object }

        member -> { Vobiz::SubAccounts::Types::ListSubaccountsResponseSubAccountsItemPermissionsCalls }
      end
    end
  end
end
