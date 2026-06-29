# frozen_string_literal: true

module Vobiz
  module SubAccounts
    module Types
      class ListSubaccountsRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
