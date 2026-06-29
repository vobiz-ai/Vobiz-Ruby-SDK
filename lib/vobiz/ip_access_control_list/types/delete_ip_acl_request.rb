# frozen_string_literal: true

module Vobiz
  module IPAccessControlList
    module Types
      class DeleteIpAclRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :ip_acl_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
