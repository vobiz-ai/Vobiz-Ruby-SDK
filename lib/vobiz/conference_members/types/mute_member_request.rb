# frozen_string_literal: true

module Vobiz
  module ConferenceMembers
    module Types
      class MuteMemberRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :conference_name, -> { String }, optional: false, nullable: false

        field :member_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
