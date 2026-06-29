# frozen_string_literal: true

module Vobiz
  module IPAccessControlList
    module Types
      class ListIpAclsRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
