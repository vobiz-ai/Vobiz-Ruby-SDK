# frozen_string_literal: true

module Vobiz
  module OriginationURI
    module Types
      class UpdateOriginationURIRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :uri_id, -> { String }, optional: false, nullable: false

        field :uri, -> { String }, optional: true, nullable: false

        field :description, -> { String }, optional: true, nullable: false

        field :priority, -> { Integer }, optional: true, nullable: false

        field :name, -> { String }, optional: true, nullable: false
      end
    end
  end
end
