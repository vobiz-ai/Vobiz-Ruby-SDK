# frozen_string_literal: true

module Vobiz
  module OriginationURI
    module Types
      class UpdateOriginationURIRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :uri_id, -> { String }, optional: false, nullable: false

        field :name, -> { String }, optional: false, nullable: false

        field :priority, -> { Integer }, optional: false, nullable: false
      end
    end
  end
end
