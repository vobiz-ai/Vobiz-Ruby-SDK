# frozen_string_literal: true

module Vobiz
  module SubAccounts
    module Types
      class DeleteSubaccountResponse < Internal::Types::Model
        field :message, -> { String }, optional: false, nullable: false
      end
    end
  end
end
