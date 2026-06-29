# frozen_string_literal: true

module Vobiz
  module SubAccounts
    module Types
      class DeleteSubaccountRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :sub_auth_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
