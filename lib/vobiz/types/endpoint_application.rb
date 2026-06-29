# frozen_string_literal: true

module Vobiz
  module Types
    class EndpointApplication < Internal::Types::Model
      field :app_id, -> { String }, optional: true, nullable: false

      field :app_name, -> { String }, optional: true, nullable: false

      field :answer_url, -> { String }, optional: true, nullable: false

      field :answer_method, -> { String }, optional: true, nullable: false
    end
  end
end
