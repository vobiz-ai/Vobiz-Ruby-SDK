# frozen_string_literal: true

module Vobiz
  module Credentials
    module Types
      class UpdateCredentialRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :credential_id, -> { String }, optional: false, nullable: false

        field :password, -> { String }, optional: false, nullable: false
      end
    end
  end
end
