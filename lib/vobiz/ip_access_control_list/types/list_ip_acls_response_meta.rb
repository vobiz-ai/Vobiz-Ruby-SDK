# frozen_string_literal: true

module Vobiz
  module IPAccessControlList
    module Types
      class ListIpAclsResponseMeta < Internal::Types::Model
        field :limit, -> { Integer }, optional: false, nullable: false

        field :offset, -> { Integer }, optional: false, nullable: false

        field :total, -> { Integer }, optional: false, nullable: false
      end
    end
  end
end
