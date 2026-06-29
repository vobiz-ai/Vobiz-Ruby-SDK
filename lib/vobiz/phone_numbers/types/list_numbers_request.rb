# frozen_string_literal: true

module Vobiz
  module PhoneNumbers
    module Types
      class ListNumbersRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :limit, -> { Integer }, optional: true, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
