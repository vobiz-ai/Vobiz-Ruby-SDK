# frozen_string_literal: true

module Vobiz
  module PhoneNumbers
    module Types
      class ListInventoryNumbersResponse < Internal::Types::Model
        field :items, -> { Internal::Types::Array[Vobiz::PhoneNumbers::Types::ListInventoryNumbersResponseItemsItem] }, optional: false, nullable: false

        field :page, -> { Integer }, optional: false, nullable: false

        field :per_page, -> { Integer }, optional: false, nullable: false

        field :total, -> { Integer }, optional: false, nullable: false
      end
    end
  end
end
