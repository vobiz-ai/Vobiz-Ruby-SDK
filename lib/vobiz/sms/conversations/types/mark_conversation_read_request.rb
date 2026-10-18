# frozen_string_literal: true

module Vobiz
  module Sms
    module Conversations
      module Types
        class MarkConversationReadRequest < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
