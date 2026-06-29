# frozen_string_literal: true

module Vobiz
  module SubAccountKyc
    module Types
      class VerifySubaccountPanRequest < Internal::Types::Model
        field :sub_auth_id, -> { String }, optional: false, nullable: false

        field :pan, -> { String }, optional: false, nullable: false
      end
    end
  end
end
