# frozen_string_literal: true

module Vobiz
  module OriginationURI
    module Types
      class ListOriginationURIsResponse < Internal::Types::Model
        field :meta, -> { Vobiz::Types::TrunkListMeta }, optional: false, nullable: false

        field :objects, -> { Internal::Types::Array[Vobiz::OriginationURI::Types::ListOriginationURIsResponseObjectsItem] }, optional: false, nullable: false
      end
    end
  end
end
