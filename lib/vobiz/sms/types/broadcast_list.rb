# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # One page of broadcasts, newest first, with the total count for paging.
      class BroadcastList < Internal::Types::Model
        field :broadcasts, -> { Internal::Types::Array[Vobiz::Sms::Types::Broadcast] }, optional: true, nullable: false

        field :total, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
