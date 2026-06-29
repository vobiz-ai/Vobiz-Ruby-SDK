# frozen_string_literal: true

module Vobiz
  module OriginationURI
    module Types
      class ListOriginationURIsResponseObjectsItem < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :account_id, -> { String }, optional: false, nullable: false

        field :uri, -> { String }, optional: false, nullable: false

        field :priority, -> { Integer }, optional: false, nullable: false

        field :weight, -> { Integer }, optional: false, nullable: false

        field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :transport, -> { String }, optional: false, nullable: false

        field :description, -> { String }, optional: false, nullable: false

        field :created_at, -> { String }, optional: false, nullable: false

        field :updated_at, -> { String }, optional: false, nullable: false
      end
    end
  end
end
