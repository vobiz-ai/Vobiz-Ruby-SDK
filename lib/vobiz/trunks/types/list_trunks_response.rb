# frozen_string_literal: true

module Vobiz
  module Trunks
    module Types
      class ListTrunksResponse < Internal::Types::Model
        field :meta, -> { Vobiz::Trunks::Types::ListTrunksResponseMeta }, optional: false, nullable: false

        field :objects, -> { Internal::Types::Array[Vobiz::Trunks::Types::ListTrunksResponseObjectsItem] }, optional: false, nullable: false
      end
    end
  end
end
