# frozen_string_literal: true

module Vobiz
  module SubAccountKyc
    module Types
      class ConfirmSubaccountCinRequest < Internal::Types::Model
        field :sub_auth_id, -> { String }, optional: false, nullable: false

        field :company_name, -> { String }, optional: false, nullable: false

        field :selected_cin, -> { String }, optional: false, nullable: false
      end
    end
  end
end
