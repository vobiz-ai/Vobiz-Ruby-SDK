# frozen_string_literal: true

module Vobiz
  module PhoneNumbers
    module Types
      class ListNumbersResponse < Internal::Types::Model
        field :items, -> { Internal::Types::Array[Vobiz::PhoneNumbers::Types::ListNumbersResponseItemsItem] }, optional: false, nullable: false

        field :page, -> { Integer }, optional: false, nullable: false

        field :per_page, -> { Integer }, optional: false, nullable: false

        field :total, -> { Integer }, optional: false, nullable: false
      end
    end
  end
end
