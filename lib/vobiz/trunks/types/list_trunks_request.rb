# frozen_string_literal: true

module Vobiz
  module Trunks
    module Types
      class ListTrunksRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
