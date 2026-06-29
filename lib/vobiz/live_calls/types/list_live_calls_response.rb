# frozen_string_literal: true

module Vobiz
  module LiveCalls
    module Types
      class ListLiveCallsResponse < Internal::Types::Model
        field :api_id, -> { String }, optional: false, nullable: false

        field :calls, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      end
    end
  end
end
