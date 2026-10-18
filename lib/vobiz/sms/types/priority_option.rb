# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # A priority option available to your account at the US 10DLC registry. Pass its `id` as `priorityId` when you
      # create or register a toll-free campaign; other keys follow the registry's schema.
      class PriorityOption < Internal::Types::Model
        field :id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
