# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # The unread total across all your conversations.
      class UnreadCount < Internal::Types::Model
        field :total_unread, -> { Integer }, optional: true, nullable: false, api_name: "totalUnread"
      end
    end
  end
end
