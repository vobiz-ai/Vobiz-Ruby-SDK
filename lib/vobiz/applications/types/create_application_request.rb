# frozen_string_literal: true

module Vobiz
  module Applications
    module Types
      class CreateApplicationRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :app_name, -> { String }, optional: false, nullable: false

        field :answer_url, -> { String }, optional: false, nullable: false

        field :answer_method, -> { String }, optional: false, nullable: false
      end
    end
  end
end
