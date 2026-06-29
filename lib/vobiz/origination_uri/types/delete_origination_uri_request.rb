# frozen_string_literal: true

module Vobiz
  module OriginationURI
    module Types
      class DeleteOriginationURIRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :uri_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
