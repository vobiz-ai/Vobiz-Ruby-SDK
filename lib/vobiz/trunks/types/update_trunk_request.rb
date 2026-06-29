# frozen_string_literal: true

module Vobiz
  module Trunks
    module Types
      class UpdateTrunkRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :trunk_id, -> { String }, optional: false, nullable: false

        field :name, -> { String }, optional: false, nullable: false

        field :max_concurrent_calls, -> { Integer }, optional: false, nullable: false

        field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false
      end
    end
  end
end
