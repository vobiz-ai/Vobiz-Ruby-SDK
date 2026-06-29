# frozen_string_literal: true

module Vobiz
  module Applications
    module Types
      class UpdateApplicationRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :app_id, -> { String }, optional: false, nullable: false

        field :app_name, -> { String }, optional: false, nullable: false

        field :default_number_app, -> { Internal::Types::Boolean }, optional: false, nullable: false
      end
    end
  end
end
