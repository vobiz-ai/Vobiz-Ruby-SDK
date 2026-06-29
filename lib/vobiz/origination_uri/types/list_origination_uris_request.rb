# frozen_string_literal: true

module Vobiz
  module OriginationURI
    module Types
      class ListOriginationURIsRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
