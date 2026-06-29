# frozen_string_literal: true

module Vobiz
  module Cdr
    module Types
      class GetCdrResponse < Internal::Types::Model
        field :data, -> { Vobiz::Cdr::Types::GetCdrResponseData }, optional: false, nullable: false

        field :success, -> { Internal::Types::Boolean }, optional: false, nullable: false
      end
    end
  end
end
