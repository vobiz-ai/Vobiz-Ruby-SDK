# frozen_string_literal: true

module Vobiz
  module PhoneNumbers
    module Types
      class ListNumbersRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :page, -> { Integer }, optional: true, nullable: false

        field :per_page, -> { Integer }, optional: true, nullable: false

        field :search, -> { String }, optional: true, nullable: false
      end
    end
  end
end
