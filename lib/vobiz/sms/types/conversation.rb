# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # A two-way thread between one of your numbers (or RCS senders) and one contact on one channel. Vobiz creates it
      # with the first message in either direction and adds every later message between the same pair on that channel.
      class Conversation < Internal::Types::Model
        field :id, -> { String }, optional: true, nullable: false

        field :account_id, -> { String }, optional: true, nullable: false, api_name: "accountId"

        field :participant_a, -> { String }, optional: true, nullable: false, api_name: "participantA"

        field :participant_b, -> { String }, optional: true, nullable: false, api_name: "participantB"

        field :channel, -> { Vobiz::Sms::Types::ConversationChannel }, optional: true, nullable: false

        field :last_message_at, -> { String }, optional: true, nullable: false, api_name: "lastMessageAt"

        field :message_count, -> { Integer }, optional: true, nullable: false, api_name: "messageCount"

        field :unread_count, -> { Integer }, optional: true, nullable: false, api_name: "unreadCount"

        field :last_read_at, -> { String }, optional: true, nullable: false, api_name: "lastReadAt"

        field :created_at, -> { String }, optional: true, nullable: false, api_name: "createdAt"
      end
    end
  end
end
