# frozen_string_literal: true

module Vobiz
  module Applications
    module Types
      class ListApplicationsResponseMeta < Internal::Types::Model
        field :limit, -> { Integer }, optional: false, nullable: false

        field :next_, -> { String }, optional: false, nullable: false, api_name: "next"

        field :offset, -> { Integer }, optional: false, nullable: false

        field :previous, -> { Object }, optional: false, nullable: true

        field :total_count, -> { Integer }, optional: false, nullable: false
      end
    end
  end
end
