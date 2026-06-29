# frozen_string_literal: true

module Vobiz
  module SubAccountKyc
    module Types
      class SearchSubaccountCinRequest < Internal::Types::Model
        field :sub_auth_id, -> { String }, optional: false, nullable: false

        field :company_name, -> { String }, optional: false, nullable: false
      end
    end
  end
end
