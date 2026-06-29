# frozen_string_literal: true

module Vobiz
  module Conferences
    module Types
      class ListConferencesRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
