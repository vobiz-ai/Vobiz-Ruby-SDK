# frozen_string_literal: true

module Vobiz
  module Credentials
    module Types
      class CreateCredentialResponse < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :account_id, -> { String }, optional: false, nullable: false

        field :username, -> { String }, optional: false, nullable: false

        field :password, -> { String }, optional: false, nullable: false

        field :realm, -> { String }, optional: false, nullable: false

        field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :created_at, -> { String }, optional: false, nullable: false

        field :updated_at, -> { String }, optional: false, nullable: false
      end
    end
  end
end
