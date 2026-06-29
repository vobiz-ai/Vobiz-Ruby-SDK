# frozen_string_literal: true

module Vobiz
  module Applications
    module Types
      class UpdateApplicationResponse < Internal::Types::Model
        field :api_id, -> { String }, optional: false, nullable: false

        field :message, -> { String }, optional: false, nullable: false
      end
    end
  end
end
