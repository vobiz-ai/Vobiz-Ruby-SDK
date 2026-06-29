# frozen_string_literal: true

module Vobiz
  module Types
    class PhoneNumber < Internal::Types::Model
      field :number, -> { String }, optional: true, nullable: false

      field :number_type, -> { Vobiz::Types::PhoneNumberNumberType }, optional: true, nullable: false

      field :country, -> { String }, optional: true, nullable: false

      field :monthly_rental_rate, -> { String }, optional: true, nullable: false

      field :status, -> { Vobiz::Types::PhoneNumberStatus }, optional: true, nullable: false
    end
  end
end
