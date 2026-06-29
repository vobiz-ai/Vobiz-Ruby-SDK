# frozen_string_literal: true

module Vobiz
  module IPAccessControlList
    module Types
      class ListIpAclsResponseObjectsItem < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :account_id, -> { String }, optional: false, nullable: false

        field :ip_address, -> { String }, optional: false, nullable: false

        field :description, -> { String }, optional: false, nullable: false

        field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :created_at, -> { String }, optional: false, nullable: false

        field :updated_at, -> { String }, optional: false, nullable: false
      end
    end
  end
end
