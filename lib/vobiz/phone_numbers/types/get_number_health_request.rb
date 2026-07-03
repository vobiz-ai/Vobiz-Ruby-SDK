# frozen_string_literal: true

module Vobiz
  module PhoneNumbers
    module Types
      class GetNumberHealthRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :e164, -> { String }, optional: false, nullable: false

        field :granularity, -> { Vobiz::PhoneNumbers::Types::GetNumberHealthRequestGranularity }, optional: true, nullable: false

        field :days, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
