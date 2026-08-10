# frozen_string_literal: true

module Vobiz
  module Types
    class ForbiddenErrorBody < Internal::Types::Model
      field :status, -> { String }, optional: true, nullable: false

      field :message, -> { String }, optional: true, nullable: false
    end
  end
end
