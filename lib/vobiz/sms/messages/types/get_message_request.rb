# frozen_string_literal: true

module Vobiz
  module Sms
    module Messages
      module Types
        class GetMessageRequest < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
