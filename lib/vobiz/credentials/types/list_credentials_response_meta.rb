# frozen_string_literal: true

module Vobiz
  module Credentials
    module Types
      class ListCredentialsResponseMeta < Internal::Types::Model
        field :limit, -> { Integer }, optional: false, nullable: false

        field :offset, -> { Integer }, optional: false, nullable: false

        field :total, -> { Integer }, optional: false, nullable: false
      end
    end
  end
end
