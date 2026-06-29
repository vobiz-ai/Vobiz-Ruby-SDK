# frozen_string_literal: true

module Vobiz
  module Conference
    module Types
      class KickMemberRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :conference_name, -> { String }, optional: false, nullable: false

        field :member_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
