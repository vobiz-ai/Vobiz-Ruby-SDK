# frozen_string_literal: true

module Vobiz
  module Types
    class NotFoundErrorBody < Internal::Types::Model
      field :error, -> { String }, optional: false, nullable: false

      field :api_id, -> { String }, optional: false, nullable: false
    end
  end
end
