# frozen_string_literal: true

module Vobiz
  module Calls
    module Types
      class MakeCallResponse < Internal::Types::Model
        field :api_id, -> { String }, optional: false, nullable: false

        field :message, -> { String }, optional: false, nullable: false

        field :request_uuid, -> { String }, optional: false, nullable: false
      end
    end
  end
end
