# frozen_string_literal: true

module Vobiz
  module PhoneNumbers
    module Types
      class AssignDidToSubaccountRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :e164, -> { String }, optional: false, nullable: false

        field :sub_account_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
