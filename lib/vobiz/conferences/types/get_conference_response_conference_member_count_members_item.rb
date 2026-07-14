# frozen_string_literal: true

module Vobiz
  module Conferences
    module Types
      class GetConferenceResponseConferenceMemberCountMembersItem < Internal::Types::Model
        field :muted, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :member_id, -> { String }, optional: true, nullable: false

        field :deaf, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :from, -> { String }, optional: true, nullable: false

        field :to, -> { String }, optional: true, nullable: false

        field :caller_name, -> { String }, optional: true, nullable: false

        field :direction, -> { String }, optional: true, nullable: false

        field :call_uuid, -> { String }, optional: true, nullable: false

        field :join_time, -> { String }, optional: true, nullable: false
      end
    end
  end
end
