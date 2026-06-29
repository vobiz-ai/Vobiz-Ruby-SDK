# frozen_string_literal: true

module Vobiz
  module Credentials
    module Types
      class DeleteCredentialRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :credential_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
