# frozen_string_literal: true

module Vobiz
  module Conferences
    module Types
      class DeleteAllConferencesRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
