# frozen_string_literal: true

module Vobiz
  module Sms
    module Messages
      module Types
        class CheckRcsReachabilityRequest < Internal::Types::Model
          field :from, -> { String }, optional: false, nullable: false

          field :to, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
