# frozen_string_literal: true

module Vobiz
  module Recordings
    module Types
      class ListRecordingsResponse < Internal::Types::Model
        field :api_id, -> { String }, optional: false, nullable: false

        field :meta, -> { Vobiz::Recordings::Types::ListRecordingsResponseMeta }, optional: false, nullable: false

        field :objects, -> { Internal::Types::Array[Vobiz::Recordings::Types::ListRecordingsResponseObjectsItem] }, optional: false, nullable: false
      end
    end
  end
end
