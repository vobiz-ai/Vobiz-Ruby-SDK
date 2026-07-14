# frozen_string_literal: true

module Vobiz
  module Conferences
    module Types
      class GetConferenceResponse < Internal::Types::Model
        extend Vobiz::Internal::Types::Union

        member -> { Vobiz::Conferences::Types::GetConferenceResponseConferenceMemberCount }

        member -> { Vobiz::Conferences::Types::GetConferenceResponseError }
      end
    end
  end
end
