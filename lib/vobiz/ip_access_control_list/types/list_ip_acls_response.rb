# frozen_string_literal: true

module Vobiz
  module IPAccessControlList
    module Types
      class ListIpAclsResponse < Internal::Types::Model
        field :meta, -> { Vobiz::IPAccessControlList::Types::ListIpAclsResponseMeta }, optional: false, nullable: false

        field :objects, -> { Internal::Types::Array[Vobiz::IPAccessControlList::Types::ListIpAclsResponseObjectsItem] }, optional: false, nullable: false
      end
    end
  end
end
