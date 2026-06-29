# frozen_string_literal: true

module Vobiz
  module IPAccessControlList
    module Types
      class CreateIpAclRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :name, -> { String }, optional: false, nullable: false

        field :ip_address, -> { String }, optional: false, nullable: false
      end
    end
  end
end
