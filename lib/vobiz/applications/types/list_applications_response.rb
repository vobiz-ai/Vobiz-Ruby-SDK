# frozen_string_literal: true

module Vobiz
  module Applications
    module Types
      class ListApplicationsResponse < Internal::Types::Model
        field :api_id, -> { String }, optional: false, nullable: false

        field :meta, -> { Vobiz::Applications::Types::ListApplicationsResponseMeta }, optional: false, nullable: false

        field :objects, -> { Internal::Types::Array[Vobiz::Applications::Types::ListApplicationsResponseObjectsItem] }, optional: false, nullable: false
      end
    end
  end
end
