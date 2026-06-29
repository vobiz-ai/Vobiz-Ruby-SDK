# frozen_string_literal: true

module Vobiz
  module Types
    class Call < Internal::Types::Model
      field :api_id, -> { String }, optional: true, nullable: false

      field :request_uuid, -> { String }, optional: true, nullable: false

      field :message, -> { String }, optional: true, nullable: false
    end
  end
end
