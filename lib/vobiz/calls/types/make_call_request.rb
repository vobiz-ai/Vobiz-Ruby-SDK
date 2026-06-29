# frozen_string_literal: true

module Vobiz
  module Calls
    module Types
      class MakeCallRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :from, -> { String }, optional: false, nullable: false

        field :to, -> { String }, optional: false, nullable: false

        field :answer_url, -> { String }, optional: false, nullable: false

        field :answer_method, -> { String }, optional: false, nullable: false
      end
    end
  end
end
