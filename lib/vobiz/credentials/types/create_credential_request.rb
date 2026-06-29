# frozen_string_literal: true

module Vobiz
  module Credentials
    module Types
      class CreateCredentialRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :username, -> { String }, optional: false, nullable: false

        field :password, -> { String }, optional: false, nullable: false
      end
    end
  end
end
