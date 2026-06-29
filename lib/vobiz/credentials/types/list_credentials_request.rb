# frozen_string_literal: true

module Vobiz
  module Credentials
    module Types
      class ListCredentialsRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
