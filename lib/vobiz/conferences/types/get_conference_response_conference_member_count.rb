# frozen_string_literal: true

module Vobiz
  module Conferences
    module Types
      class GetConferenceResponseConferenceMemberCount < Internal::Types::Model
        field :conference_name, -> { String }, optional: false, nullable: false

        field :conference_run_time, -> { String }, optional: false, nullable: false

        field :conference_member_count, -> { String }, optional: false, nullable: false

        field :members, -> { Internal::Types::Array[Vobiz::Conferences::Types::GetConferenceResponseConferenceMemberCountMembersItem] }, optional: false, nullable: false

        field :api_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
