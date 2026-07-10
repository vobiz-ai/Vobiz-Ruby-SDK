# frozen_string_literal: true

module Vobiz
  module PhoneNumbers
    module Types
      class ListInventoryNumbersRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :country, -> { String }, optional: true, nullable: false

        field :search, -> { String }, optional: true, nullable: false

        field :exclude, -> { String }, optional: true, nullable: false

        field :page, -> { Integer }, optional: true, nullable: false

        field :per_page, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
