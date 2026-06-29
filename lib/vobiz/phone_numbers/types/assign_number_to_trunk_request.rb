# frozen_string_literal: true

module Vobiz
  module PhoneNumbers
    module Types
      class AssignNumberToTrunkRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :phone_number, -> { String }, optional: false, nullable: false

        field :trunk_group_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
