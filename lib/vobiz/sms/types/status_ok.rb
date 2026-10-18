# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # Confirmation returned by actions that have no resource to return, such as marking a conversation read or
      # creating or deleting an opt-out.
      class StatusOk < Internal::Types::Model
        field :status, -> { String }, optional: true, nullable: false
      end
    end
  end
end
