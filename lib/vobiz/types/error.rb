# frozen_string_literal: true

module Vobiz
  module Types
    class Error < Internal::Types::Model
      field :api_id, -> { String }, optional: true, nullable: false

      field :error, -> { String }, optional: true, nullable: false

      field :message, -> { String }, optional: true, nullable: false
    end
  end
end
