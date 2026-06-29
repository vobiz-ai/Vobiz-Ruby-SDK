# frozen_string_literal: true

module Vobiz
  module Conferences
    module Types
      class ListConferencesResponse < Internal::Types::Model
        field :api_id, -> { String }, optional: false, nullable: false

        field :conferences, -> { Internal::Types::Array[Object] }, optional: false, nullable: false
      end
    end
  end
end
