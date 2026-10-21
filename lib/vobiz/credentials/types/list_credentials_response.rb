# frozen_string_literal: true

module Vobiz
  module Credentials
    module Types
      class ListCredentialsResponse < Internal::Types::Model
        field :meta, -> { Vobiz::Types::TrunkListMeta }, optional: false, nullable: false

        field :objects, -> { Internal::Types::Array[Vobiz::Credentials::Types::ListCredentialsResponseObjectsItem] }, optional: false, nullable: false
      end
    end
  end
end
