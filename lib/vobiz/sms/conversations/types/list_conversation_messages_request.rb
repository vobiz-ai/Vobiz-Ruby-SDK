# frozen_string_literal: true

module Vobiz
  module Sms
    module Conversations
      module Types
        class ListConversationMessagesRequest < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :limit, -> { Integer }, optional: true, nullable: false

          field :offset, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
