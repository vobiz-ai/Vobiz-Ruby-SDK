# frozen_string_literal: true

module Vobiz
  module Applications
    module Types
      class DeleteApplicationRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :app_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
