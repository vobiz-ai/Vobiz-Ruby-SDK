# frozen_string_literal: true

module Vobiz
  module Trunks
    module Types
      class DeleteTrunkRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :trunk_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
