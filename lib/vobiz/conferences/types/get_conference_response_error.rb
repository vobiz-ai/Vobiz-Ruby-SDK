# frozen_string_literal: true

module Vobiz
  module Conferences
    module Types
      class GetConferenceResponseError < Internal::Types::Model
        field :error, -> { Vobiz::Conferences::Types::GetConferenceResponseErrorError }, optional: false, nullable: false

        field :api_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
