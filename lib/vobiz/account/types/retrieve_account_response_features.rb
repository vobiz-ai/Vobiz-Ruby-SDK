# frozen_string_literal: true

module Vobiz
  module Account
    module Types
      class RetrieveAccountResponseFeatures < Internal::Types::Model
        field :call_queue, -> { Internal::Types::Boolean }, optional: false, nullable: false
      end
    end
  end
end
